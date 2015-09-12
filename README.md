# Vimod-Pub Demo Email

Demo of Vimod-Pub making an emailable HTML

## Installation 

1. Download and install Node JavaScript, Windows Installer (.msi) 32 or 64 bit to suit your computer, from [https://nodejs.org/en/download/](https://nodejs.org/en/download/)
2. Goto or create a folder where you want to install your script. (Not in **Program Files** as you need Admin approval for that area). Suggestion C:\node.
3. Open a command prompt in your chosen folder. Hold down shift and right click on your chosen folder, then select **Open command window here**
4. In the command prompt type `npm install indiamcq\vimod-pub-demo-email`

The basic instalation is done. The last few line should look like this:

```
parser2@3.8.3, lodash@3.10.1)
+-- svgo@0.5.6 (whet.extend@0.9.9, colors@1.1.2, mkdirp@0.5.1, coa@1.0.1, sax@1.
1.2, js-yaml@3.3.1)
Vimod-Pub-Demo-Email@0.0.0 node_modules\Vimod-Pub-Demo-Email
```

There should be no red colored text indicating errors.

## Accessing and testing the basic installation

5. When all done, type in `cd node_modules\Vimod-Pub-Demo-Email`
6. Then type in `pub`  then press \[enter\]

You can now create the email by following the menu steps

## Recommended Optional Changes

Before or after doing the two steps above, you may want to do the following.

* In Windows Explorer move the **Vimod-Pub-Demo-Email** folder to another place. It has been installed as a **node_module** but it is not really a **node_module** So it does not need to stay in any particular location except out of Admin protected folders.
* Create a shorcut to pub.cmd in the **Vimod-Pub-Demo-Email** folder and put it in a place where you can find it.
* Now run the pub.cmd file via the created shortcut.
* Now press `d` and \[enter\] to create a clone of the 2015-09 email project 
* Name your new email project

## Creating your own email (Short Version)

In the  **Vimod-Pub-Demo-Email\data\DemoEmail\YourProject** folder open the following files in your favourite text editor (PSPad for me) or Notepad:

* content.txt
* banner-subhead.txt
* calendar.txt
* link.txt

Replace the demo email content with your content. Replace the banner.png with your PNG file of the same name.
 
Run pub.cmd and create your HTML tailord to sending as an email.
 
## Creating your own email (Long Version)
 
Download and read [DemoEmail-long-version.html](DemoEmail-long-version.html)