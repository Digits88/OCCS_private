var express = require('express');
var http = require('http');
var path = require('path');
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;


// Start express application
var app = express();


/*MySql connection*/
var connection = require('express-myconnection'),
    mysql = require('mysql');

//Database connection details
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'root',
    database : 'test'
});
connection.query('USE casecontroldb');


//==================================================================
// Define the strategy to be used by PassportJS
passport.use(new LocalStrategy(
    function (username, password, done) {
        
        var query = "SELECT * FROM casecontroldb.users where username = '" + username + "' and password = '" + password + "'";
        
        connection.query(query, function (err, rows) {
            if (err)
                return done(err);
            if (!rows.length) {
                //return done(null, false, req.flash('loginMessage', 'No user found.')); // req.flash is the way to set flashdata using connect-flash
                return done(null, false, { message: 'No user found.' });
            }
            
            // if the user is found but the password is wrong
            if (!(rows[0].password == password))
                //return done(null, false, req.flash('loginMessage', 'Oops! Wrong password.')); // create the loginMessage and save it to session as flashdata
                return done(null, false, { message: 'Oops! Wrong password.' });
            
            // all is well, return successful user
            
            //return done(null, rows[0]);
            return done(null, { name: username });


        });
        
        //if (username === "admin" && password === "admin") // stupid example
        //    return done(null, { name: "admin" });
        
        //return done(null, false, { message: 'Incorrect username.' });
    }
));

// =========================================================================
// LOCAL SIGNUP ============================================================
// =========================================================================
// we are using named strategies since we have one for login and one for signup
// by default, if there was no name, it would just be called 'local'
passport.use('local-signup', new LocalStrategy(
    {
        usernameField : 'username',
        passwordField : 'password', passReqToCallback : true
    },
    function (req, username, password, done) {
        
        // find a user whose email is the same as the forms email
        // we are checking to see if the user trying to login already exists
        var query = "SELECT * FROM users WHERE username  = '" + username + "' and password = '" + password + "';";
        connection.query(query, function (err, rows) {
            //  console.log(rows);
            
            if (err) // error connecting to database
                return done(err);
            if (rows.length) { // user exists
                return done(null, false, { message: 'That username is already taken.' });
            //return done(null, false, req.flash('signupMessage', 'That email is already taken.'));
            } else {
                
                // if there is no user with that email
                // create the user
                var newUserMysql = new Object();
                
                newUserMysql.username = username;
                newUserMysql.password = password; // use the generateHash function in our user model
                
                var insertQuery = "INSERT INTO users ( username, password ) values ('" + username + "','" + password + "')";
                
                connection.query(insertQuery, function (err, rows) {
                    newUserMysql.id = rows.insertId;
                    
                    return done(null, { name: username });
                });
            }
        });
    }));

// Serialized and deserialized methods when got from session
passport.serializeUser(function (user, done) {
    done(null, user);
});

passport.deserializeUser(function (user, done) {
    done(null, user);
});

// Define a middleware function to be used for every secured routes
var auth = function (req, res, next) {
    if (!req.isAuthenticated())
        res.send(401);
    else
        next();
};
//==================================================================


// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.cookieParser());
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(express.session({ secret: 'securedsession' }));
app.use(passport.initialize()); // Add passport initialization
app.use(passport.session());    // Add passport initialization
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
    app.use(express.errorHandler());
}

//==================================================================
// routes
app.get('/', function (req, res) {
    res.render('index', { title: 'Express' });
});

app.get('/users', auth, function (req, res) {
    //res.send([{ name: "user1" }, { name: "user2" }]);
    console.log(req.params);
    var query = "SELECT * FROM users";
    connection.query(query, function (err, rows) {
        //  console.log(rows);
        
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // user exists
            res.send(rows);
        }
    });
});

app.delete('/user/:user_id', auth, function (req, res) {
    var user_id = req.params.user_id;
    var query = "DELETE FROM users WHERE id = " + user_id;
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // user exists
            res.send({success:'Success'});
        }
    });
});

app.get('/clients', auth, function (req, res) {
    //res.send([{ name: "user1" }, { name: "user2" }]);
    console.log(req.params);
    var query = "SELECT * FROM clients";
    connection.query(query, function (err, rows) {
        //  console.log(rows);
        
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // user exists
            res.send(rows);
        }
    });
});

//app.get('/clients/:fileno', auth, function (req, res) {
//    var fileno = req.params.fileno;
//    var query = "select * from generalinformation where fileno = " + fileno;
//    console.log(query);
//    connection.query(query, function (err, rows) {
//        if (err) // error connecting to database
//            return done(err);
//        //if (rows.length) { // general information exists
//            console.log(rows);
//            res.send(rows);
//        //}
//    });
//});

app.get('/clients/:fileno', auth, function (req, res) {
    var fileno = req.params.fileno;
    var query = "call getClientGeneralInformation(" + fileno + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        //if (rows.length) { // general information exists
        console.log(rows);
        res.send(rows);
        //}
    });
});
//==================================================================

//==================================================================
// route to test if the user is logged in or not
app.get('/loggedin', function (req, res) {
    res.send(req.isAuthenticated() ? req.user : '0');
});

// route to log in
app.post('/login', passport.authenticate('local'), function (req, res) {
    res.send(req.user);
});

// route to log in
app.post('/register', passport.authenticate('local-signup'), function (req, res) {
    res.send(req.user);
});


// route to log out
app.post('/logout', function (req, res) {
    req.logOut();
    res.send(200);
});
//==================================================================

http.createServer(app).listen(app.get('port'), function () {
    console.log('Express server listening on port ' + app.get('port'));
});


