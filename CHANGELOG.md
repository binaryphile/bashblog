Change Log
==========

The format is based on [Keep a Changelog] and this project adheres to
[Semantic Versioning], with the minor exception that v10 is considered
v0 in semver parlance.

2.8 and earlier
---------------

-   2.8 Bugfixes<br/> Slavic language support thanks to Tomasz
    Jadowski<br/> Removed the now defunct Twitter JSON API share
    count<br/> Support for static, not managed by bashblog html
    files<br/>
-   2.7 Store post date on a comment in the html file (\#96).<br/> On
    rebuild, the post date will be synchronised between comment date and
    file date, with precedence for comment date.
-   2.6 Support for multiple authors, use a different `.config` for each
    one
-   2.5 Massive code cleanup by Martijn Dekker<br/> 'tags' command<br/>
    The word 'posts' in the tag list (both website and command) now has
    a singular form, check out `template_tags_posts_singular`
-   2.4 Added Twitter summaries metadata for posts (\#36)
-   2.3.3 Removed big comment header.<br/> Added option to display tags
    for cut articles on index pages (\#61)<br/> Cleaned up "all posts"
    page (\#57)
-   2.3.2 Option to use topsy instead of twitter for references
-   2.3.1 Cookieless Twitter option
-   2.3 Intelligent tag rebuilding and Markdown by default
-   2.2 Flexible post title -&gt; filename conversion
-   2.1 Support for tags/categories.<br/> 'delete' command
-   2.0.3 Support for other analytics code, via external file
-   2.0.2 Fixed bug when $body\_begin\_file was empty.<br/> Added extra
    line in the footer linking to the github project
-   2.0.1 Allow personalized header/footer files
-   2.0 Added Markdown support.<br/> Fully support BSD date
-   1.6.4 Fixed bug in localized dates
-   1.6.3 Now supporting BSD date
-   1.6.2 Simplified some functions and variables to avoid duplicated
    information
-   1.6.1 'date' fix when hours are 1 digit.
-   1.6.0 Disqus comments. External configuration file. Check of 'date'
    command version.
-   1.5.1 Misc bugfixes and parameter checks
-   1.5 Đurađ Radojičić (djura-san) refactored some code and added
    flexibility and i18n
-   1.4.2 Now issues are handled at Github
-   1.4.1 Some code refactoring
-   1.4 Using twitter for comments, improved 'rebuild' command
-   1.3 'edit' command
-   1.2.2 Feedburner support
-   1.2.1 Fixed the timestamps bug
-   1.2 'list' command
-   1.1 Draft and preview support
-   1.0 Read http://is.gd/Bkdoru

  [Keep a Changelog]: http://keepachangelog.com/
  [Semantic Versioning]: http://semver.org/
  [Unreleased]: https://github.com/binaryphile/sorta/compare/v11.10.10...v11.10
