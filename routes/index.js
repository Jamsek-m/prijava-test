var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var formidable = require('formidable');
var crypto = require('crypto');

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'uporabnik',
	password: 'uporabnik',
	database: 'learning'
});


function avtentikacija(req, res, next){
	if(!req.session.user){
		res.redirect('/login');
	} else {
		next();
	}
}

/* GET home page. */
router.get('/', avtentikacija,function(req, res) {
	res.render('index', {user: req.session.user.display});
});

router.get('/login', function(req, res){
	res.render('login', {successMessage: "", abortMessage: ""});
});

router.post('/login', function(req, res){
	var form = formidable.IncomingForm();
	form.parse(req, function(err, polja){
		if(err) throw err;

		var prijava = {
			upime : polja.log_usr,
			geslo : crypto.createHash('sha256').update(polja.log_pass).digest("hex")
		}

		var sql = "SELECT USER_ID, USER_NAME, USER_PASS, USER_DIS_NAME FROM TEST_USERS";
		connection.query(sql, function(err, rows){
			if(err) throw err;

			for(var i = 0; i < rows.length; i++){
				if(rows[i].USER_NAME === prijava.upime && rows[i].USER_PASS === prijava.geslo){
					req.session.user = {
						id: rows[i].USER_ID,
						username: rows[i].USER_NAME,
						password: rows[i].USER_PASS,
						display: rows[i].USER_DIS_NAME
					};
					console.log("Uporabnik "+req.session.user.username+"("+req.session.user.display+") se je prijavil");
					res.redirect('/');
				}
			}
			res.render('login', {successMessage: "", abortMessage: "Napačno uporabniško ime ali geslo."});
		});
	});
});

router.post('/register', function(req, res){

	var form = formidable.IncomingForm();
	form.parse(req, function(err, polja){
		if(err) throw err;

		var upime = polja.usr;
		var geslo = crypto.createHash('sha256').update(polja.pass).digest("hex");
		var display = polja.dis;
		var sql = "INSERT INTO TEST_USERS(USER_NAME, USER_PASS, USER_DIS_NAME) VALUES ('"+upime+"','"+geslo+"', '"+display+"')";
		connection.query(sql, function(err, rows){
			if(err) throw err;
			console.log("Uporabnik "+upime+"("+display+") se je registriral");
			res.render('login', {successMessage: "Registracija je uspela!", abortMessage:""});
		})
	});
});

router.get('/profile',avtentikacija, function(req, res){
	res.render('profile', {
							display : req.session.user.display,
							upime: req.session.user.username,
							id: req.session.user.id
						});	
});

router.get('/logout', function(req, res){
	req.session.user = null;
	res.redirect('/');
})

module.exports = router;
