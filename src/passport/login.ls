User = require '../models/user'
require! {'bcrypt-nodejs', 'passport-local'}
LocalStrategy = passport-local.Strategy

is-valid-password = (user, password)-> 
  console.log password
  bcrypt-nodejs.compare-sync password, user.userPassword

module.exports = (passport)!-> passport.use 'login',  new LocalStrategy pass-req-to-callback: true, (req, username, password, done)!->
  (error, user) <- User.find-one {userName: username}
  return (console.log "Error in login: ", error ; done error) if error

  if not user
    console.log msg = "Can't find user: #{username}"
    done null, false, req.flash 'message', msg
  else if not is-valid-password user, password
    console.log msg = "Invalid password"
    done null, false, req.flash 'message', msg
  else
    console.log msg = "Login success"
    done null, user