                 
# Make an email that looks good for everyone

We all want to send an email that will look good on every device. You can't solve every problem but you can do some simple things to ensure your email will render well on most devices.

So this first edition of Digital Publishing Bulletin will focus on technologies that can be used to make an email that will render well accros devices. The files used to make this edition can be found [https://github.com/indiamcq/vimod-pub-demo-email](https://github.com/indiamcq/vimod-pub-demo-email) and this email in HTML can be downloaded from there as well.

The next section *Overview* is mildly technical, if you just want to try it, jump to [*Setting up your email project*](#lk3).

# Overview 

The text of the email will be written in a plain text markup language called Rho. It is similar to MarkDown language (used by GitHub.com) but adds `id` and `class` attributes. That makes Rho much more flexible in how you can make it look. That plain text is rendered into HTML fragments (no `html`, `head` or `body` elements). From there the main content is made into an XML document via Jade template engine. That XML is feed into a XSLT2 transformations that generates ids in the xml and an unordered list `ul` with links to the `h1` elements. Then Jade is used again to make several outputs. One is the email HTML and another is a HTML ready via Firefox for creating a PDF.

At this stage we look at the HTML in a browser to see how it looks. Did we do our markup consistently? Is the styling via the external Cascading Style Sheet (CSS) doing what we want it to do?

If we just adjust the CSS then we only need to refresh the browser to update the look. But if we change content in the source files then we have to rebuld the HTML.

When the HTML for the email looks good then we can process it further to make it ready to email. Juice takes the HTML and the CSS and combines them so that each style is applied to each element. The external CSS is no longer needed. Then that file is Inlined so that all the pictures are embedded in the HTML. This way you have a HTML that is very portable with everything (except fonts) in the one file.

# Setting up your email project 

To create your own email project using this method, 

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

{.center}
![Vimod menu 1](../img/demoemail1-s.gif) <br />
1. Demo Email start screen.

* You can now create the DemoEmail email by following the menu steps a and b.
  * Select *DemoEmail* by typing `a` then `enter`
  * Select *2015-09* by typing `a` then `enter`
  * Select *clone this project to a new sibling folder* by typing `d` then `enter`
  * Enter the name of the new project then press `enter`

A copy of the project that created this email will be copied to your new project. Once you have done that then close that black box by typing `z` several times until it dissapears.

Navigate to the *data\DemoEmail\Yourproject* folder. 

In most Vimod-Pub prjects you need to set the variables in the *setup\project.tasks* file. In this case the file has project defaults set that probably do not need changing. You are welcome to look.

You need a banner picture. Mine is called *banner.png*. If you name yours the same you don't need to edit anything. If you have say *mybanner.jpg*, then open up the open up the *templates\DemoEmail.jade* file and on the 12th line change the *banner.png* to *mybanner.jpg*. You banner picture must be in the `img` subfolder. That is the place for any other pictures also.

As you can make two different HTML files for different purposes, you also would need to edit the *templates\DemoEmail-pdf-firefox.jade* file to change it in the same way on line 10.

All the other changes you make in these files:

* content.txt
* calendar.txt
* banner-subhead.txt
* link.txt


You can put what you like in *banner-subhead.txt*, the demo has a subheader and a date. Delete my content line under `\{.banner-subhead\}` and add sub header. Then change the date. `\{.banner-subhead\}` is a class name that ties the content to styling in the email.css file.
 
The *calendar.txt* is there if you need it to flag upcoming event. Either remove all the content if you have no need of a calendar section or edit and andd your own calendar events.

The *link.txt* is where you can put your links and address information. Maybe this would change from one email to the other, but often not. You need to edit this to suit your situation.

Your main content goes into the *content.txt*. This needs my content removed and yours added.

Once you have added some content double click on pub.cmd again and select the menu item you want and press `enter`. In your project folder under *data\DemoEmail\YouProject* You should find your email created ready for revising. This is an iterative process. Edit then remake HTML.

## Rho Markup 

To create a headings use a one of more # at the beginning of a line: 

`# Heading level 1` 

`## heading level 2`

A paragraph should always have a blank line before and after it.

A line starting with a * is a list item: 

`* Unordered list item`

`1. Ordered list item`

Picture are inserted using this syntax \!\[This is the Alt wording\]\(img\mypic.jpg\)

Hyper links are similar to pictures but don't have the ! at the front. Unlike the picture the bit in the \[square brackets\]\(#lk4\) does show as the [hyperlinked text](#lk4).

*Bold* text is delimited like this \*before and after\*. _Italic_ text has \_before and after\_.

[Fuller documentation is here.](https://github.com/inca/rho/blob/master/SYNTAX.md)

## Sending the Email

Using Thunderbird email client you can create a new email.
 
* Then Ctrl+A to highlight the whole email. 
* From the menu select Insert/HTML
* From the email you have created using step b copy averything from between the <body> </body> tags and past into the Insert HTML dialog box.
* Click Insert

The Email looking as it looked in the browser should be visible. Once you add addresses the email is ready to go.

See also: [Using Thunderbird Add-On](#tbaddon)

# Technology stack  

## Vimod-Pub 

[Vimod-Pub](http://projects.palaso.org/projects/vimod-pub) provides the setup and control framework to build the bits we need. It was designed to:

* be a publishing tool chain, easier to write and learn than an Ant build file or Node Grunt file.
* provide support for XSLT2 transformation and Consistent Changes Tables
* be easier to write than batch files, by simpler more predictable syntax and by hiding the complex syntax
* in a sequence of transformations the input and output does not need to be specified.
* be quicker to adjust, add or remove a step and maintain
* provide a reusable shell with reusable code
* put documentation first (rather than later or never)
* It is meant to be an open tool chain that is adjustable at every step.
* can be extended to use any command line tool

The system works on Win7, 8 and 10. It is not tested on Win XP but may work but has no Unicode support.

Once a project is set up with a *project.menu* file and usually a *project.tasks* file, you can start the *pub.cmd* file. This brings up for me:

{.center}
![Vimod menu 1](../img/vimod-menu1-s.gif) <br />
2. My Vimod-Pub with many groups of projects, some with sub groups.

But you will see this:

{.center}
![Vimod menu 1](../img/demoemail1-s.gif) <br />
3. Demo Email start screen.

As above navigate to the project menu by:

* Select *DemoEmail* by typing `a` then `enter`
* Select *2015-09* by typing `a` then `enter`

You should then see:

{.center}
![Vimod menu 1](../img/demoemail2-s.gif) <br />
3. Demo Email project menu.

The initial menus you navigated were auto generated from the folder structure. When you arrived at _2015-09_ project the program detected that there was a *setup\project.menu* file. This file looks like this:

<pre>
<code><span style="font: 10pt Courier New;"><span class="general1-identifier">make</span><span class="general1-space"> </span><span class="general1-identifier">xhtml</span><span class="general1-space"> </span><span class="general1-identifier">for</span><span class="general1-space"> </span><span class="general1-identifier">making</span><span class="general1-space"> </span><span class="general1-identifier">email</span><span class="general1-space"> </span><span class="general1-identifier">and</span><span class="general1-space"> </span><span class="general1-identifier">PDF</span><span class="general1-space">               </span><span class="general1-key">;tasklist</span><span class="general1-space"> </span><span class="general1-identifier">ab-build-xhtml.tasks
make</span><span class="general1-space"> </span><span class="general1-identifier">html</span><span class="general1-space"> </span><span class="general1-identifier">with</span><span class="general1-space"> </span><span class="general1-identifier">inline</span><span class="general1-space"> </span><span class="general1-identifier">css</span><span class="general1-space"> </span><span class="general1-identifier">and</span><span class="general1-space"> </span><span class="general1-identifier">pictures</span><span class="general1-space"> </span><span class="general1-identifier">for</span><span class="general1-space"> </span><span class="general1-identifier">email</span><span class="general1-space">  </span><span class="general1-key">;tasklist</span><span class="general1-space"> </span><span class="general1-identifier">ab-make-email-html.tasks
</span><span class="general1-comment">#create fo of HTML                                 ;tasklist ab-make-fo.tasks
#create PDF of FO                                  ;tasklist ab-make-pdf.tasks 
</span><span class="general1-identifier">make</span><span class="general1-space"> </span><span class="general1-identifier">all</span><span class="general1-space"> </span><span class="general1-identifier">steps</span><span class="general1-space">                                    </span><span class="general1-key">;tasklist</span><span class="general1-space"> </span><span class="general1-identifier">ab-make-all.tasks
clone</span><span class="general1-space"> </span><span class="general1-identifier">this</span><span class="general1-space"> </span><span class="general1-identifier">project</span><span class="general1-space"> </span><span class="general1-identifier">to</span><span class="general1-space"> </span><span class="general1-identifier">a</span><span class="general1-space"> </span><span class="general1-identifier">new</span><span class="general1-space"> </span><span class="general1-identifier">sibling</span><span class="general1-space"> </span><span class="general1-identifier">folder</span><span class="general1-space">        </span><span class="general1-key">;tasklist</span><span class="general1-space"> </span><span class="general1-identifier">new-project-sibling.tasks
</span></span></code></pre>

You will notice that only the first two lines and the 5th and 6th lines are showing in the menu. The 3rd and 4th lines have a # at the beginning so are commented out and are not shown in the menu. They are there as future possibilities.

The *project.tasks* file in the project *setup* folder has only a few variables. It looks like this.

<pre>
<code><span style="font: 10pt Courier New;"><span class="general1-comment"># project.tasks
</span><span class="general1-identifier">define</span><span class="general1-space"> </span><span class="general1-identifier">project</span><span class="general1-space"> </span><span class="general1-identifier">name</span><span class="general1-space">                               </span><span class="general1-key">;var</span><span class="general1-space"> </span><span class="general1-identifier">pcode</span><span class="general1-space"> </span><span class="general1-string">&quot;DemoEmail&quot;
</span><span class="general1-identifier">define</span><span class="general1-space"> </span><span class="general1-identifier">list</span><span class="general1-space"> </span><span class="general1-identifier">of</span><span class="general1-space"> </span><span class="general1-identifier">headers</span><span class="general1-space"> </span><span class="general1-identifier">to</span><span class="general1-space"> </span><span class="general1-identifier">include</span><span class="general1-space"> </span><span class="general1-identifier">in</span><span class="general1-space"> </span><span class="general1-identifier">index</span><span class="general1-space">        </span><span class="general1-key">;var</span><span class="general1-space"> </span><span class="general1-identifier">header_list</span><span class="general1-space"> </span><span class="general1-string">&quot;h1&quot;
</span><span class="general1-identifier">as</span><span class="general1-space"> </span><span class="general1-identifier">no</span><span class="general1-space"> </span><span class="general1-keywords2">xslt</span><span class="general1-space"> </span><span class="general1-identifier">first</span><span class="general1-space"> </span><span class="general1-identifier">make</span><span class="general1-space"> </span><span class="general1-identifier">sure</span><span class="general1-space"> </span><span class="general1-identifier">temp</span><span class="general1-space"> </span><span class="general1-identifier">dir</span><span class="general1-space"> </span><span class="general1-identifier">exists</span><span class="general1-space">        </span><span class="general1-key">;checkdir</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\xml&quot;
</span><span class="general1-identifier">make</span><span class="general1-space"> </span><span class="general1-identifier">project.</span><span class="general1-keywords2">xslt</span><span class="general1-space"> </span><span class="general1-identifier">from</span><span class="general1-space"> </span><span class="general1-identifier">the</span><span class="general1-space"> </span><span class="general1-identifier">above</span><span class="general1-space"> </span><span class="general1-identifier">variables</span><span class="general1-space">        </span><span class="general1-key">;projectxslt
</span></span></code></pre>


You'll note the first line is just a comment line as it starts with a #. The remaining lines look like a menu file. The difference is that the part before the ; is a comment or documentation. Remember Vimod puts documentation first.

Mainly `project.tasks` files have variable declarations. Generally a `tasklist` that is run from a menu will first call the project.tasks to get all the project variables. Also you will see a projectxslt on the last line. This last command creates a `project.xslt` that can be found in the `scripts\xslt` folder. This file contains all of the project variables for use in XSLT transformation. If you change the `project.tasks` file the next time you run a menu item the `project.xslt` will be updated.

Also of note is the variable header_list. While this list only has h1 it could also have h2 and h3 in it. Naming the variable with a \_list at the end tells the script that makes the project.xslt that a variable should be made with the list tokenized.

Many projects require a lot of variables. This one does not require many.

You'll notice that the menu above specifies as the first menu item.

`make xhtml for making email and PDF    ;tasklist ab-build-xhtml.tasks` 

The file *ab-build-xhtml.tasks* is not in the setup folder, though it could be, but is in the common *tasks* folder so it can be used by other projects. Vimod looks in the project *setup* folder first then in the common *tasks* folder. The tasklist looks like this:

<pre>
<code><span style="font: 10pt Courier New;"><span class="general1-identifier">project</span><span class="general1-space"> </span><span class="general1-identifier">xslt</span><span class="general1-space"> </span><span class="general1-identifier">to</span><span class="general1-space"> </span><span class="general1-identifier">define</span><span class="general1-space"> </span><span class="general1-identifier">the</span><span class="general1-space"> </span><span class="general1-identifier">projectpath</span><span class="general1-space">   </span><span class="general1-key">;projectvar
</span><span class="general1-identifier">Make</span><span class="general1-space"> </span><span class="general1-identifier">the</span><span class="general1-space"> </span><span class="general1-identifier">txt</span><span class="general1-space"> </span><span class="general1-identifier">into</span><span class="general1-space"> </span><span class="general1-identifier">html</span><span class="general1-space">                  </span><span class="general1-key">;tasklist</span><span class="general1-space"> </span><span class="general1-identifier">node-rho.tasks</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\banner-subhead.txt&quot;</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\xml\banner-subhead.html&quot;
</span><span class="general1-identifier">Make</span><span class="general1-space"> </span><span class="general1-identifier">the</span><span class="general1-space"> </span><span class="general1-identifier">txt</span><span class="general1-space"> </span><span class="general1-identifier">into</span><span class="general1-space"> </span><span class="general1-identifier">html</span><span class="general1-space">                  </span><span class="general1-key">;tasklist</span><span class="general1-space"> </span><span class="general1-identifier">node-rho.tasks</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\content.txt&quot;</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\xml\content.html&quot;
</span><span class="general1-identifier">Make</span><span class="general1-space"> </span><span class="general1-identifier">the</span><span class="general1-space"> </span><span class="general1-identifier">txt</span><span class="general1-space"> </span><span class="general1-identifier">into</span><span class="general1-space"> </span><span class="general1-identifier">html</span><span class="general1-space">                  </span><span class="general1-key">;tasklist</span><span class="general1-space"> </span><span class="general1-identifier">node-rho.tasks</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\calendar.txt&quot;</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\xml\calendar.html&quot;
</span><span class="general1-identifier">Make</span><span class="general1-space"> </span><span class="general1-identifier">the</span><span class="general1-space"> </span><span class="general1-identifier">txt</span><span class="general1-space"> </span><span class="general1-identifier">into</span><span class="general1-space"> </span><span class="general1-identifier">html</span><span class="general1-space">                  </span><span class="general1-key">;tasklist</span><span class="general1-space"> </span><span class="general1-identifier">node-rho.tasks</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\link.txt&quot;</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\xml\link.html&quot;
</span><span class="general1-identifier">Make</span><span class="general1-space"> </span><span class="general1-identifier">content</span><span class="general1-space"> </span><span class="general1-identifier">xml</span><span class="general1-space"> </span><span class="general1-identifier">for</span><span class="general1-space"> </span><span class="general1-identifier">creating</span><span class="general1-space"> </span><span class="general1-reservedword">TOC</span><span class="general1-space">       </span><span class="general1-key">;tasklist</span><span class="general1-space"> </span><span class="general1-identifier">node-jade.tasks</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\templates\content.jade&quot;</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\xml\content.xml&quot;
</span><span class="general1-identifier">Make</span><span class="general1-space"> </span><span class="general1-reservedword">TOC</span><span class="general1-space"> </span><span class="general1-identifier">in</span><span class="general1-space"> </span><span class="general1-identifier">ul</span><span class="general1-space">                          </span><span class="general1-key">;xslt</span><span class="general1-space"> </span><span class="general1-identifier">ab-toc</span><span class="general1-space"> </span><span class="general1-string">&quot;&quot;</span><span class="general1-space"> </span><span class="general1-string">&quot;&quot;</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\xml\toc.html&quot;
</span><span class="general1-comment">#
</span><span class="general1-identifier">Make</span><span class="general1-space"> </span><span class="general1-identifier">xhtml</span><span class="general1-space"> </span><span class="general1-identifier">for</span><span class="general1-space"> </span><span class="general1-identifier">PDF</span><span class="general1-space">                      </span><span class="general1-key">;tasklist</span><span class="general1-space"> </span><span class="general1-identifier">node-jade.tasks</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\templates\%pcode%-pdf-firefox.jade&quot;</span><span class="general1-space">  </span><span class="general1-string">&quot;%projectpath%\%pcode%-pdf.html&quot;
</span><span class="general1-identifier">Make</span><span class="general1-space"> </span><span class="general1-identifier">html</span><span class="general1-space"> </span><span class="general1-identifier">for</span><span class="general1-space"> </span><span class="general1-identifier">processing</span><span class="general1-space"> </span><span class="general1-identifier">for</span><span class="general1-space"> </span><span class="general1-identifier">email</span><span class="general1-space">      </span><span class="general1-key">;tasklist</span><span class="general1-space"> </span><span class="general1-identifier">node-jade.tasks</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\templates\%pcode%.jade&quot;</span><span class="general1-space"> </span><span class="general1-string">&quot;%projectpath%\%pcode%.html&quot;</span><span class="general1-space"> 
</span></span></code></pre>


Note the first line calls the `;projectvar` that makes the *project.tasks* available to the project.

The next line after the comments has:

```  ;tasklist node-rho.tasks "%projectpath%\banner-subhead.txt" "%projectpath%\xml\banner-subhead.html"```

So the current *ab-build-xhtml.tasks* tasklist will run another tasklist *node-rho.tasks*, that takes two variables, and input file and an output file. That same tasklist is used with other input and output. 

The *%projectpath%* is a built in variable. You never declare it. It is used both in Vimod and in XSLT transformation.

The *node-rho.tasks* and the following *node-jade.tasks* show ways Vimod-Pub can be extended to run non included programs.

Then we come to a _Jade_ task.

`  ;tasklist node-jade.tasks "%projectpath%\templates\content.jade" "%projectpath%\xml\content.xml"` 

This too has its own tasklist *node-jade.tasks*. It has two parameters too and input file and an output file. Jade does no allow you to name the output file but you can specify the out path and extension. The output file name part will match the input name part.

The next task is a built in XSLT transforation:

`  ;xslt ab-toc "" "" "%projectpath%\xml\toc.html"`

No tasklist is called as the XSLT handling is built into Vimod-Pub. The *ab-toc* is shorthand for referring to *ab-toc.xslt* file. The file extension is not needed and should not be used. Then comes three parameters with the first two empty double quotes.

* The first is where parameters go. In this case the parameters are in the *project.xslt* that is made and included in the *ab-toc.xslt* file. 
* The second is where you can put the input file but as it is using the output of the previous _Jade_ task no file needs to be specified. 
* The third is the output file as we want it in a particular place with a particular name. If the output was being transformed again you would not need to name it and would only have:

`  ;xslt ab-toc`

I use PSPad to edit my .menu and .tasks files. I Have syntax highlighting to aid understanding.
                                                        
## XSLT transformations 

This project only has one transformation.

* create an index for placing at the top of the sidebar.

The missing transformation for this project would be to add the *id* anchors in automatically, but for now they are put in manually on the headers.

Saxon 9 HE is used as the XSLT9 transforation engine. This is a built in part of Vimod-Pub. 

## Node Java Script 

Node JS provides a very collaborative environment. Follow this link to find out [more about Node.JS](https://nodejs.org/). The following tools all require Node to run.

### Rho markup conversion 

Rho is a variant of MarkDown. Rho includes markup for *id* and *class*. It takes simple markup text files and converts them to fragments of HTML. Rho works in the Node.JS environment. I have outline the markup above. More can be found [here](https://github.com/inca/rho/blob/master/SYNTAX.md).

### Jade template engine  

Jade too works in the Node.JS environment. It has a simple way of writing HTML or any XML document. It has *include*s that have been used in this example. The Jade templates are kept in the templates folder with the .jade extension.

### Juice inline css

Juice works in the Node.JS environment. It takes the external CSS or CSS in the head of the file and adds style attributes to the elements directly. Some email clients do not make use of CSS styles in the head of an email. Gmail does not also.

### Inliner

Inliner takes external pictures and embeds them in the email so that it is very portable. A forwarded email would have all the pictures included. Inliner also works in the Node.JS environment.

## Banner creation

The banner was created using Inkscape SVG editor. SVG (Scalable Vector Graphics). See the link to Inkscape in the sidebar.

## Using Thunderbird Add-On to insert email 

A slightly easier wany to create your email in Thunderbird is to use an add-on called: viewsourcewith from [http://dafizilla.sourceforge.net/viewsourcewith/index.php](http://dafizilla.sourceforge.net/viewsourcewith/index.php) Once you set up an editor you can just open the entire HTML form Thunderbird in chosen editor and replace the whole HTML with your newly created HTML.