Assignment 2: Carousel
======================

<img src="https://raw.githubusercontent.com/kevnull/ios-course-carousel/master/carousel.gif"/>

# Time Spent
Approximately 10 hours

# Required

* Photo tiles on the initial screen
* Sign In
   * Tapping on email/password reveals the keyboard and shifts the scrollview and Sign In button up.
   * User sees an error alert when no email is present or no password is present.
   * User sees a loading screen upon tapping the Sign In button.
   * User sees an error alert when entering the wrong email/password combination.
   * ~~User is taken to the tutorial screens upon entering the correct email/password combination.~~ Did not do this since it doesn't make sense for a signed in user to see tour and it was implemented in sign up.
* Tutorial Screens
   * User can page between the screens
* Image Timeline
   * Display a scrollable view of images.
   * User can tap on the conversations button to see the conversations screen (push).
   * User can tap on the profile image to see the settings view (modal from below).
* Settings
   * User can dismiss the settings screen.
   * User can log out

# Optional / Additional

* _Parse Integration_
   * Creates actual account against Parse db
   * Sign in checks against Parse
   * Gif above was recorded before Parse integration
* Intro
   * Tiles animate with scroll
   * Refactored code to dynamically cycle through image views of tiles
* Create Account
   * Checks for all fields
   * Checks for password matches
   * Terms of service webview
   * Checks for terms to be agreed on
   * Signing in takes user to Tour
   * Forms and buttons move when keyboard appears
* Tour
   * Dots update for page
   * Backup button fades in on last page and dots disappear
   * Backup has a switch

