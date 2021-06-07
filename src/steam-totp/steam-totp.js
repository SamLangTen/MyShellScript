#!/usr/local/bin/node
// This script is used to generate Steam style TOTP Code
// NodeJS must be installed and install SteamTOTP library by:
//      npm install -g steam-totp
//
// A configuration file containing secrect must be put under home folder and named as .steamtotp
// The config file is JSON structure:
// [
//      {
//          "username": "user1",
//          "secret": "secret1"
//      },
//      {
//          "username": "user2",
//          "secret": "secret2"
//      }
// ]

var SteamTotp = require('steam-totp');
var fs = require('fs');
var path = require('path');
const USER_HOME = process.env.HOME || process.env.USERPROFILE
const secretFilename = path.join(USER_HOME,".steamtotp");
var jsonText = fs.readFileSync(secretFilename);
var  secretsConfig = JSON.parse(jsonText);
secretsConfig.forEach(t => {
    console.log(t.username+": "+SteamTotp.generateAuthCode(t.secret));
});
