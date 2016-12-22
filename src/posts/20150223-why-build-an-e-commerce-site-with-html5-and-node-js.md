---
title: Build an E-Commerce Site With HTML5 and Node.js
description: Node.js and HTML5 complement one another. Node.js provides horsepower to load web pages, and HTML5 gives your front-end functionality.
archive_title: Why build an e-commerce site with HTML5 and Node.js?
---

# Build an E-Commerce Site With HTML5 and Node.js

In a previous post, [we discussed](http://blogs.syrinx.com/mobile-development/node-js-and-html5-a-match-made-in-mobile-heaven/) why using HTML5 and Node.js to build a mobile app is a heck of an idea.

While Node.js is by no means perfect, its ability to support thousands of concurrent connections on a single thread is an incredible asset to developers creating programs with high data transaction needs. As for HTML5, it allows developers to move past the clunky, antiquated functionality of its predecessor. 

_"Shoppers want checkout to be fast and consistent."_

So, why would you create an e-commerce website with Node.js serving the back end and HTML5 serving the front end? Is the approach the same as our take on building mobile apps? 

**Listen to the shoppers **  
Before diving into the benefits of using HTML5 and Node.js to construct an e-commerce site, it's important to assess what consumers want. On the surface level, people desire easy navigability, a quick way to access information and a checkout process that doesn't take 10 minutes to complete. From a more granular perspective, PrestaShop's Natalie Biegel [noted several factors that influence](https://www.prestashop.com/blog/en/the-top-10-things-customers-are-looking-for-on-your-e-commerce-site/) shopper behavior:

  * Studies have shown that the majority of consumers leave websites after waiting more than 3 seconds for them to load. Yes, bandwidth, RAM and other elements can dictate how fast a page loads, but backend data communication management is also a factor. 
  * Everybody loves a deal, and e-commerce customers are no exception. Furthermore, promotions and discounts must be applicable to a shopper's interests. In a survey of 1,100 consumers conducted by MyBuys, 39 percent of respondents said they [purchase more from merchants](http://www.marketingprofs.com/charts/2013/10235/personalized-marketing-drives-buyer-readiness-and-sales) that deliver personalized item recommendations. 
  * If a person is browsing for items online, he or she is likely a frequent social media user. It's not uncommon for people to share listings for cool products on Twitter, Facebook, Pinterest and other websites. 

From a development standpoint, we can glean a few insights from these considerations. First, time is of the essence - a necessity that can be met with certain functions offered by Node.js. Second, the website must deliver relevant ads to online shoppers, which suggests that integration with Google DoubleClick for Publishers, a CRM solution and other applications is needed. Third, connecting to social media platform APIs through HTML5 is essential. 

![HTML5 can provide the front-end functionality customers favor. ](http://pictures.brafton.com/x_0_0_0_14098671_800.jpg)HTML5 can provide the front-end functionality customers favor.

**Giving the website its juice  **  
One beneficial component of Node.js is how it communicates with other platforms. Readwrite contributor Lauren Orsini noted that Node.js runs JavaScript [by employing Google's V8](http://readwrite.com/2013/11/07/what-you-need-to-know-about-nodejs). What V8 does is enable Node.js to translate JavaScript into native machine language as opposed to converting it into bytecode, so this subverts one of the conventional communication slowdowns. 

Bouncing off V8's integration, a signature benefit is Node.js' ability to sanction asynchronous communications. It leverages a capability known as the Event Loop, which allows data to be transmitted whenever it's available. That means the latency caused by a client requesting services from the server (in this case, the consumer uploading an e-commerce website) is reduced. 

_"We'd recommended creating a map of which APIs will connect to HTML5."_

**Working well with others **  
As developers, we'd recommended creating a map of which APIs connect which applications, and how this overarching compatibility will impact your e-commerce site's performance. To keep things simple, let's assume your ad server is connected to Google DoubleClick for Publishers.

Connecting a DoubleClick exit (i.e. a function that directs browsers to other Web pages when they click on ads), necessitates a two step process, according to Google support:

"First, define the exit name in your HTML5 files. Then, when you upload the creative in the Studio Web UI, add a destination URL to the exit you defined."

All things considered, Node.js and HTML5 complement one another quite nicely. The former provides the horsepower needed to quickly load Web pages, while the the latter needs a limited number of plugins to give you the front-end functionality visitors appreciate.
