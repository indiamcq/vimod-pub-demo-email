# Vimod-Pub Demo Email

Demo of Vimod-Pub making an emailable HTML

## Installation 

* If you don't have it, download and install Node JavaScript, Windows Installer (.msi) 32 or 64 bit to suit your computer, from [https://nodejs.org/en/download/](https://nodejs.org/en/download/) To check type `where node` in a command prompt.
* If you don't have it, download and install Java from [https://java.com/en/download/](https://java.com/en/download/) To check type `where java` in a command prompt.
* Download the ZIP file from [https://github.com/indiamcq/vimod-pub-demo-email zip file](https://github.com/indiamcq/vimod-pub-demo-email/archive/master.zip)
* Goto or create a folder where you want to install your demo email builder. (Not in **Program Files** as you need Admin approval for that area). Suggestion **C:\node**. 
* Now place the contents of the zip file in the folder you selected or created.
* Open a command prompt in your chosen folder. Hold down shift and right click on your chosen folder, then select **Open command window here**
* In the command prompt type `npm install`

The basic instalation is done. The last few line should look something like this, it may not be the same:

```
0.1, js-yaml@3.3.1)
+-- cheerio@0.19.0 (dom-serializer@0.1.0, entities@1.1.1, css-select@1.0.0, html
parser2@3.8.3, lodash@3.10.1)
```

There should be no red colored text indicating errors.

## Accessing and testing the basic installation

* Then type in `pub`  then press \[enter\]
* Navigate to the project.
* You can now create the DemoEmail email by following the menu steps a and b.

## Recommended Optional Changes

Before or after doing the steps above, you may want to do the following.

* Create a shorcut to pub.cmd in the **Vimod-Pub-Demo-Email** folder and put it in a place where you can find it.
* Now run the pub.cmd file via the created shortcut.
* Now press `d` and \[enter\] to create a clone of the 2015-09 email project **MyTestEmail** 
* Name your new email project. i.e. **MyTestEmail**
* Create your own email in this newly created project.

## Creating your own email (Short Version)

In the  **Vimod-Pub-Demo-Email\data\DemoEmail\MyTestEmail** folder open the following files in your favourite text editor (PSPad for me) or Notepad:

* content.txt
* banner-subhead.txt
* calendar.txt
* link.txt

Replace the demo email content with your content. Replace the banner.png with your PNG file of the same name.
 
Run pub.cmd and create your HTML tailord to sending as an email.
 
## Creating your own email (Long Version)
 
Download and read [DemoEmail-long-version.html](DemoEmail-long-version.html)