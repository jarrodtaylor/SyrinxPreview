title: Migration Gotchas for Windows Phone 8

+++


# Migration Gotchas for Windows Phone 8

Here I will detail some of the problems I ran into during migration from Android to WP8, and how you might recognize them/fix them or better yet, avoid them. Hindsight is 20/20, knowing what I know now, this is how I would go about things. The general gist is Cloud, then Outlook, then New Phone. I will refer to your current phone as Old Phone, and the Windows Phone 8 you are going to buy as New Phone. I'll refer to Outlook.com as OLDC. I am assuming you are coming from an existing smartphone (probably Android), that you don't use Exchange for email or calendar, but you do use Outlook on the desktop. You might currently have your Outlook calendar syncing to Google calendar. 

 

A) Take care of the Cloud prerequisites. Before you even go to buy your Windows Phone, do the following, in order. 

  1. Make sure that all your current "must have" apps exist on WP8. Make a list of apps and features, and then go to <http://www.windowsphone.com/en-us> and search for each of those apps. I was skeptical that a few would be there but I was pleasantly surprised
  2. If you already have a Windows Live ID, decide if you want to use it with your New Phone. If you do not, create a Live ID. I made one with the same naming convention [@hotmail.com](mailto:@hotmail.com) that I used with [@gmail.com.](mailto:@gmail.com.) Instructions on creating your LiveID: <http://windows.microsoft.com/en-us/windows-live/sign-up-create-account-how>  
  3. Sign in to Hotmail with your Live ID from a desktop machine. Stroll around. You may get asked to upgrade to Outlook.com after a few logins. If so then accept, it may save you some time later. I had Hotmail, then setup Outlook sync, then moved to Outlook.com and had to deal with some Captcha hell before I got it working again. 
  4. Go to the Contacts section of OLDC (or Hotmail, if you are still there). If you have LinkedIn and Facebook accounts, I recommend linking them to sync contacts now, before you even touch a phone. Get the bulk of it ironed out in the cloud and do ONE sync to your new phone, instead of a bunch of piecemeal ones.
  5. To that end, assuming you use Google to sync your contacts from your Old Phone, you should link that account as well. Beware of the Google 2 Factor Auth Gotcha noted below if you have two factor authentication enabled. 
  6. It will take a little while for all those contacts to sync, assuming you have a few hundred in each. Go kill a half hour reading tweets or something.
  7. Once the contacts are all on board, there is an option in OLDC (you've been upgraded by now, right?) to link and clean up the contacts that OLDC could not do on its own. Go to the People section and under Manage choose Clean Up Contacts. Three at a time, you'll be asked to confirm the links it thinks it should make. Click next a bunch of times until clean. 
  8. While you're at it, click on SkyDrive and set up a few files on there. Maybe put some frequently used docx or PDF files on there that you want to edit. Evernote doesn't yet support editable attachments on WP8, so Skydrive will have to suffice. 

 

B) Take care of the Outlook prerequisites. This is all still before you buy your phone. Get your Outlook syncing to Hotmail correctly.

  1. Disable and/or uninstall your Google calendar sync, if you have it. Google has abandoned you. Attend grief counseling. [http://support.google.com/calendar/bin/answer.py?hl=en&answer=94020](http://support.google.com/calendar/bin/answer.py?hl=en&answer=94020) 
  2. Download and install the Hotmail Connector for Outlook. It will work with OLDC too. <http://office.microsoft.com/en-us/outlook/microsoft-office-outlook-hotmail-connector-overview-HA010222518.aspx> 
  3. You probably want it so that your current calendar events propagate over, and your new calendar events (organized by you, or accepted by you) show up in your Hotmail/OLDC calendar. This was not intuitive to me, I had to make Hotmail my default account for new events. See the note from smevdj below, and this link, especially the video: <http://support.microsoft.com/kb/2454811> (I had to re-watch the calendar copying part a few times to follow it)
  4. Make sure you can create a new event, or accept a calendar invite, and have it automagically propagate to OLDC, where you can see it in the browser. It is not instantaneous after an Outlook sync, it may take a little bit and multiple F5 refreshes, but it should show up.

 

C) Now that you are ready, get the phone. Charge it up. Enter your Live ID, and let everything sync to the phone. Install some apps while this happens in the background. If you really liked Google Voice for your voicemail, there is an excellent app called Go Voice that is even better than the official Android Google Voice app IMO. Download it and configure it. Watch out for 2 factor auth here too. You will also want to add your LinkedIn, Facebook, and Google accounts on the phone. 

 

D) Bliss...

 

Google 2 Factor Auth Gotcha:

 

If you have two factor authentication (SMS confirmations on all Google logins) turned on like I did, this applies to you. When you go to link your Google account from Hotmail/Outlook.com, make sure that you are LOGGED OUT of your Google account in the browser before you start the connection process. The linking process will not allow you to use the one-time passwords from Google, you have to use your "real" password and an SMS confirmation from your Old Phone. The problem is, if you are logged in to Google already, the connection wizard will seem to work without asking you for your username or password. Then your two factor authentication SMS will kick in, and it will send a text message to your Old Phone. But there is no form on the desktop browser's web page for you to type the SMS back in to, the wizard says you are done. So you'll wonder why you are getting the SMS code. This will happen over and over, about every half hour, SMS after SMS, until you go back in and delete the connection, log out of Google, and start the wizard up again. To avoid this:

 

Make sure you are logged out of Google. Start the connection process from Hotmail or Outlook.com to link to Google. You will now be prompted for your username and password. You will get the SMS authentication box on the next screen. Type in the SMS that was just sent to your Old Phone. Check the box to not be bothered again on this device. Click the button to continue and finish the wizard.

 

Note from smevdj:

_ _

_I now have this working. The key is to only use the new Calendar that was created with the Outlook Connector. I have turned off the views of my original calendar and put all events in the new Calendar that is seen on Outlook.com. So after copying events to the new calendar, deselect the check box to view the original outlook calendar.   _

_I guess I missed this step in the Outlook Connector setup._

_Now that this is working I am a happy camper. Love the Nokia 920._
