var express = require('express');
var http = require('http');
var path = require('path');
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var js2xmlparser = require("js2xmlparser");
var fs = require('fs');
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
            res.send({ success: 'Success' });
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

// ************************************************
//      Get Client General Information by FileNo
// ************************************************
app.get('/clients/generalInfo/:fileno', auth, function (req, res) {
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

// ************************************************
//      Get Client Additional Information by FileNo
// ************************************************
app.get('/clients/additionalInfo/:fileno', auth, function (req, res) {
    var fileno = req.params.fileno;
    var query = "call getAdditionalClientInfo(" + fileno + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            console.log(rows);
            var obj = rows[0][0];
            if (obj == null) {
                var additionalInfo = [[{
                            fileNo: fileno,
                            clientOccupation: '',
                            employer: '',
                            address: '',
                            city: '',
                            state: '',
                            spouseLastName: '',
                            spouseFirstName: '',
                            spouseOccupation: '',
                            spouseAddress: '',
                            spouseEmployer: '',
                            spouseCity: '',
                            spouseState: ''
                        }]];
                res.send(additionalInfo);
            } else {
                res.send(rows);
            }
        }
    });
});
// ************************************************
//      Get Client Auto Information by FileNo
// ************************************************
app.get('/clients/clientAutoInfo/:fileno', auth, function (req, res) {
    var fileno = req.params.fileno;
    var query = "call getClientautoinfo(" + fileno + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            console.log(rows);
            
            if (rows[0][0] == null) {
                var clientAutoInfo = [
                    [
                        {
                            fileNo: fileno,
                            insuranceCompany: '',
                            address: '',
                            city: '',
                            state: '',
                            zip: '',
                            phoneNumber: '',
                            adjuster: '',
                            policyNumber: '',
                            effectiveStartDate: null,
                            effectiveEndDate: null,
                            medPayAvailable: '',
                            amount: 0,
                            liabilityMinCoverage: 0,
                            liabilityMaxCoverage: 0,
                            UMIMin: 0,
                            UMIMax: 0,
                            reimbursable: 0,
                            notes: ''
                        }
                    ]
                ];
                res.send(clientAutoInfo);
            } else {
                res.send(rows);
            }
        }
    });
});

// ************************************************
//      Get Client Medical Insurance Information by FileNo
// ************************************************
app.get('/clients/medicalInsuranceInfo/:fileno', auth, function (req, res) {
    var fileno = req.params.fileno;
    var query = "call getMedicalInsurance(" + fileno + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            console.log(rows);
            
            if (rows[0][0] == null) {
                var medicalInsuranceInfo = [[
                        {
                            fileNo : fileno ,
                            namedInsured : '',
                            insuranceCompany : '',
                            address : '',
                            city : '',
                            state : '',
                            zip : '',
                            phoneNumer : '',
                            policyNumber : '',
                            mediCalNumber : '',
                            mediCareNumber : '',
                            claimNumber : ''
                        }]];
                res.send(medicalInsuranceInfo);

            } else {
                res.send(rows);
            }
        }
    });
});

// ************************************************
//      Get Client Injuries by FileNo
// ************************************************
app.get('/clients/clientInjuries/:fileno', auth, function (req, res) {
    var fileno = req.params.fileno;
    var query = "call getClientInjuries(" + fileno + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            console.log(rows);
            res.send(rows);
        }
    });
});

// ************************************************
//      Get Defendant Information by FileNo
// ************************************************
app.get('/clients/defendantInfo/:fileno', auth, function (req, res) {
    var fileno = req.params.fileno;
    var query = "call getDefendantInformation(" + fileno + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            console.log(rows);
            
            if (rows[0][0] == null) {
                var defendantInfo = [[
                        {
                            fileNo : fileno,
                            lastName : '',
                            firstName : '',
                            address : '',
                            city : '',
                            state : '',
                            zip : '',
                            homePhone : '',
                            businessPhone : '',
                            dateOfBirth : null,
                            drivingLicense : ''
                        }]];
                res.send(defendantInfo);
            } else {
                res.send(rows);
            }
        }
    });
});

// ************************************************
//      Get Defendant Attorney Information by FileNo
// ************************************************
app.get('/clients/defendantAttorneyInfo/:fileno', auth, function (req, res) {
    var fileno = req.params.fileno;
    var query = "call getDefendantAttorneyInfo(" + fileno + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            console.log(rows);
            
            if (rows[0][0] == null) {
                var defendantAttorneyInfo = [[
                        {
                            fileNo : fileno,
                            firm : '',
                            attorney : '',
                            address : '',
                            city : '',
                            state : '',
                            zip : '',
                            phone : ''
                        }]];
                res.send(defendantAttorneyInfo);
            } else {
                res.send(rows);
            }
        }
    });
});

// ************************************************
//      Get Defendant Insurance Information by FileNo
// ************************************************
app.get('/clients/defendantInsuranceInfo/:fileno', auth, function (req, res) {
    var fileno = req.params.fileno;
    var query = "call getDefendantInsurance(" + fileno + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            console.log(rows);
            
            if (rows[0][0] == null) {
                var defendantInsuranceInfo = [[
                        {
                            fileNo : fileno,
                            nameOfInsured : '',
                            insuranceCompany : '',
                            address : '',
                            city : '',
                            state : '',
                            zip : '',
                            phone : '',
                            adjuster : '',
                            claimNumber : '',
                            policyLimits : ''
                        }]];
                
                res.send(defendantInsuranceInfo);
            } else {
                res.send(rows);
            }
        }
    });
});

// ************************************************
//      Get Statute Information by FileNo
// ************************************************
app.get('/clients/statuteInfo/:fileno', auth, function (req, res) {
    var fileno = req.params.fileno;
    var query = "call getStatuteInformation(" + fileno + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            if (rows[0][0] == null) {
                var statuteInfo = [
                    [
                        {
                            fileNo: fileno,
                            yrFromAccident: null,
                            _2yrFromAccident: null,
                            complaintFiledDate: null,
                            _60daysFromFiledDate: null,
                            _2yrsDate: null,
                            _3yrsDate: null,
                            _5yrsDate: null,
                            isGovtClaim: 'false'
                        }
                    ]
                ];

                res.send(statuteInfo);
            } else {
                res.send(rows);
            }
        }
    });
});

// ************************************************
//      Get Statute Govt Claim Information by FileNo
// ************************************************
app.get('/clients/govtClaimInfo/:fileno', auth, function (req, res) {
    var fileno = req.params.fileno;
    var query = "call getGovtClaimDetails(" + fileno + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            if (rows[0][0] == null) {
                var govtClaimInfo = [
                    [
                        {
                            fileNo : fileno,
                            _6monthsStatue : null,
                            sl1yr : null,
                            _2yrs : null,
                            city : '',
                            cityRejectedDate : null,
                            cityRejectedAfter6Months : null,
                            county : '',
                            countyRejectedDate : null,
                            countyRejectedAfter6Months : null,
                            state : '',
                            stateRejectedDate : null,
                            stateRejectedAfter6Months : null,
                            other : '',
                            otherRejectedDate : null,
                            otherRejectedAfter6Months : null
                        }
                    ]
                ];
                res.send(govtClaimInfo);
            } else {
                res.send(rows);
            }
        }
    });
});

// ************************************************
//      Get Court Information by FileNo
// ************************************************
app.get('/clients/courtInfo/:fileno', auth, function (req, res) {
    var fileno = req.params.fileno;
    var query = "call getCourtInformation(" + fileno + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            if (rows[0][0] == null) {
                var courtInfo = [
                    [
                        {
                            fileNo : fileno,
                            caseNumber : '',
                            court : '',
                            address : '',
                            city : '',
                            state : '',
                            zip : ''
                        }
                    ]
                ];
                
                res.send(courtInfo);
            } else {
                res.send(rows);
            }
        }
    });
});

// ************************************************
//      Get Statute Govt Claim Information by FileNo
// ************************************************
app.get('/clients/miscInfo/:fileno', auth, function (req, res) {
    var fileno = req.params.fileno;
    var query = "call getMicInfo(" + fileno + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            console.log(rows);
            res.send(rows);
        }
    });
});

// ************************************************
//      Get New File No.
// ************************************************
app.get('/clients/newFileNo', auth, function (req, res) {
    var query = "call getNewFileNo()";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            console.log(rows);
            res.send(rows);
        }
    });
});

// ************************************************
//      Create New Client
// ************************************************
app.post('/clients/createNewClient', auth, function (req, res) {
    console.log(req.body);
    var newClient = js2xmlparser("newClient", req.body.newClient);
    
    var fileNo = req.body.newClient.generalInformation.fileNo;
    var firstName = req.body.newClient.generalInformation.firstName;
    var lastName = req.body.newClient.generalInformation.lastName;
    
    // Create new client with FileNo, FirstName and LastName in Clients table
    var query = "call createNewClient(" + fileNo + "," + "'" + firstName + "'" + "," + "'" + lastName + "'" + ")";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        if (rows.length) { // general information exists
            console.log(rows);
        }
    });
    
    // ********************* Save General Information **********************
    saveGeneralInformation(req.body.newClient.generalInformation);
    
    // ********************* Additional Client Information **********************
    saveAdditionalInfo(req.body.newClient.additionalInfo);
    
    // ********************* Client Auto Information **********************
    var clientAutoInfo = js2xmlparser("clientAutoInfo", req.body.newClient.clientAutoInfo);
    writeNewClientSectionInDB(clientAutoInfo, "clientAutoInfo", "<clientAutoInfo>");
    
    // ********************* Client Medical Insurance Information **********************
    var medicalInsuranceInfo = js2xmlparser("medicalInsuranceInfo", req.body.newClient.medicalInsuranceInfo);
    writeNewClientSectionInDB(medicalInsuranceInfo, "medicalinsurance", "<medicalInsuranceInfo>");
    
    // ********************* Defendant Information **********************
    var defendantInfo = js2xmlparser("defendantInfo", req.body.newClient.defendantInfo);
    writeNewClientSectionInDB(defendantInfo, "defendantinformation", "<defendantInfo>");
    
    // ********************* Defendant Attorney Information **********************
    var defendantAttorneyInfo = js2xmlparser("defendantAttorneyInfo", req.body.newClient.defendantAttorneyInfo);
    writeNewClientSectionInDB(defendantAttorneyInfo, "defendantattorneyinfo", "<defendantAttorneyInfo>");
    
    // ********************* Defendant Insurance Information **********************
    var defendantInsuranceInfo = js2xmlparser("defendantInsuranceInfo", req.body.newClient.defendantInsuranceInfo);
    writeNewClientSectionInDB(defendantInsuranceInfo, "defendantinsurance", "<defendantInsuranceInfo>");
    
    // ********************* Statute Information **********************
    var statuteInfo = js2xmlparser("statuteInfo", req.body.newClient.statuteInfo);
    writeNewClientSectionInDB(statuteInfo, "statuteinformation", "<statuteInfo>");
    
    // ********************* Govt Claim Information **********************
    var govtClaimInfo = js2xmlparser("govtClaimInfo", req.body.newClient.govtClaimInfo);
    writeNewClientSectionInDB(govtClaimInfo, "govtclaimdetails", "<govtClaimInfo>");
    
    // ********************* Court Information **********************
    var court = js2xmlparser("court", req.body.newClient.court);
    writeNewClientSectionInDB(court, "courtinformation", "<court>");
    
    res.send(200);
});

// ************************************************
//      Update General section
// ************************************************
app.post('/clients/generalInfo', auth, function (req, res) {
    var query = "call deleteGeneralInfo('" + req.body.generalInformation.fileNo + "')";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
        {
            console.log(err);
            res.send(400);
        }
        saveGeneralInformation(req.body.generalInformation);
    });
    res.send(200);
});

function saveGeneralInformation(generalInformation) {
    // ********************* Save General Information **********************
    var generalInformation = js2xmlparser("generalInformation", generalInformation);
    writeNewClientSectionInDB(generalInformation, "generalInformation", "<generalInformation>");
}

// ************************************************
//      Update Additional Client Section
// ************************************************
app.post('/clients/additionalInfo', auth, function (req, res) {
    var query = "call deleteAdditionalInfo('" + req.body.additionalInfo.fileNo + "')";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        
        saveAdditionalInfo(req.body.additionalInfo);
    });
    res.send(200);
});

function saveAdditionalInfo(additionalInfo) {
    var additionalInfo = js2xmlparser("additionalInfo", additionalInfo);
    writeNewClientSectionInDB(additionalInfo, "additionalclientinfo", "<additionalInfo>");
}


// ************************************************
//      Update Client Auto Section
// ************************************************
app.post('/clients/clientAutoInfo', auth, function (req, res) {
    var query = "call deleteClientAutoInfo('" + req.body.clientAutoInfo.fileNo + "')";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        saveClientAutoInfo(req.body.clientAutoInfo);
    });
    res.send(200);
});

function saveClientAutoInfo(clientAutoInfo) {
    var clientAutoInfo = js2xmlparser("clientAutoInfo", clientAutoInfo);
    writeNewClientSectionInDB(clientAutoInfo, "clientAutoInfo", "<clientAutoInfo>");
}


// ************************************************
//      Update Client Medical Insurance Section
// ************************************************
app.post('/clients/clientMedicalInsuranceInfo', auth, function (req, res) {
    var query = "call deleteClientMedicalInsuranceInfo('" + req.body.medicalInsuranceInfo.fileNo + "')";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
            return done(err);
        saveClientMedicalInsuranceInfo(req.body.medicalInsuranceInfo);
    });
    res.send(200);
});

function saveClientMedicalInsuranceInfo(medicalInsuranceInfo) {
    var medicalInsuranceInfo = js2xmlparser("medicalInsuranceInfo", medicalInsuranceInfo);
    writeNewClientSectionInDB(medicalInsuranceInfo, "medicalinsurance", "<medicalInsuranceInfo>");
}


// ************************************************
//      Update Defendant Information Section
// ************************************************
app.post('/clients/defendantInfo', auth, function (req, res) {
    var query = "call deleteDefendantInfo('" + req.body.defendantInfo.fileNo + "')";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
        {
            console.log(err);
            res.send(400);
        }
        saveDefendantInfo(req.body.defendantInfo);
    });
    res.send(200);
});

function saveDefendantInfo(defendantInfo) {
    var defendantInfo = js2xmlparser("defendantInfo", defendantInfo);
    writeNewClientSectionInDB(defendantInfo, "defendantinformation", "<defendantInfo>");
}


// ************************************************
//      Update Defendant Attorney Section
// ************************************************
app.post('/clients/defendantAttorneyInfo', auth, function (req, res) {
    var query = "call deleteDefendantAttorneyInfo('" + req.body.defendantAttorneyInfo.fileNo + "')";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
        {
            console.log(err);
            res.send(400);
        }
        saveDefendantAttorneyInfo(req.body.defendantAttorneyInfo);
    });
    res.send(200);
});

function saveDefendantAttorneyInfo(defendantAttorneyInfo) {
    var defendantAttorneyInfo = js2xmlparser("defendantAttorneyInfo", defendantAttorneyInfo);
    writeNewClientSectionInDB(defendantAttorneyInfo, "defendantattorneyinfo", "<defendantAttorneyInfo>");
}


// ************************************************
//      Update Defendant Insurance Section
// ************************************************
app.post('/clients/defendantInsuranceInfo', auth, function (req, res) {
    var query = "call deleteDefendantInsuranceInfo('" + req.body.defendantInsuranceInfo.fileNo + "')";
    console.log(query);
    connection.query(query, function (err, rows) {
        if (err) // error connecting to database
        {
            console.log(err);
            res.send(400);
        }
        saveDefendantInsuranceInfo(req.body.defendantInsuranceInfo);
    });
    res.send(200);
});

function saveDefendantInsuranceInfo(defendantInsuranceInfo) {
    var defendantInsuranceInfo = js2xmlparser("defendantInsuranceInfo", defendantInsuranceInfo);
    writeNewClientSectionInDB(defendantInsuranceInfo, "defendantinsurance", "<defendantInsuranceInfo>");
}

function writeNewClientSectionInDB(sectionData, sectionName, rowName) {
    
    var xmlFilePathName = __dirname + "\\XmlData\\" + sectionName + ".xml";
    console.log(xmlFilePathName);
    
    // save xml to disk
    fs.writeFile(xmlFilePathName, sectionData, function (err) {
        if (err) throw err;
        console.log(sectionName + '.xml saved');
        
        // load general information xml into table
        var query = "LOAD XML LOCAL INFILE \"" + xmlFilePathName.replace(/\\/gi, "/") + "\" INTO TABLE  " + sectionName + " ROWS IDENTIFIED BY '" + rowName + "';";
        //var query = "LOAD XML LOCAL INFILE \"C:/Balram Data/Nodejs/AuthenticationAngularJS-master/XmlData/generalInformation.xml\" INTO TABLE generalinformation ROWS IDENTIFIED BY '<generalInformation>';";
        console.log(query);
        connection.query(query, function (err, rows) {
            if (err) // error connecting to database
            {
                console.log(err);
                return done(err);
            }
        //}
        });
    });
}
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


