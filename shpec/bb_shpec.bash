source import.bash

shpec_helper_imports=(
  initialize_shpec_helper
  shpec_source
  stop_on_error
)
eval "$(importa shpec-helper shpec_helper_imports)"
initialize_shpec_helper
stop_on_error=true
stop_on_error

shpec_source bin/bb

describe all_posts
  it "outputs basic html"; (
    archive_index=out
    stub_command ls 'echo one.html'
    stub_command date
    stub_command is_boilerplate_file false
    stub_command continue
    stub_command get_post_title
    stub_command create_html_page
    stub_command mv
    stub_command chmod
    stub_command rm

    expected=$'<h3></h3>\n<li><a href="one.html"></a> &mdash; </li>\n</ul>\n<div id="all_posts"><a href="./"></a></div>'
    all_posts >/dev/null
    assert equal "$expected" "$(< out.*)"
    unstub_command rm
    rm out.*
    return $_shpec_failures ); (( _shpec_failures += $? )) ||:
  end
end

describe all_tags
  it "outputs basic html"; (
    tags_index=out
    stub_command grep
    stub_command date
    stub_command break
    stub_command create_html_page
    stub_command mv
    stub_command chmod
    stub_command rm

    expected=$'<h3></h3>\n<ul>\n<li><a href="*.html">*</a> &mdash;  </li>\n</ul>\n<div id="all_posts"><a href="./"></a></div>'
    all_tags >/dev/null
    assert equal "$expected" "$(< out.*)"
    unstub_command rm
    rm out.*
    return $_shpec_failures ); (( _shpec_failures += $? )) ||:
  end
end

describe create_css
  it "writes blog.css"; (
    stub_command ln

    create_css
    IFS=$'\n' read -rd '' expected <<'EOS' ||:
#title{font-size: x-large;}
        a.ablack{color:black !important;}
        li{margin-bottom:8px;}
        ul,ol{margin-left:24px;margin-right:24px;}
        #all_posts{margin-top:24px;text-align:center;}
        .subtitle{font-size:small;margin:12px 0px;}
        .content p{margin-left:24px;margin-right:24px;}
        h1{margin-bottom:12px !important;}
        #description{font-size:large;margin-bottom:12px;}
        h3{margin-top:42px;margin-bottom:8px;}
        h4{margin-left:24px;margin-right:24px;}
        img{max-width:100%;}
        #twitter{line-height:20px;vertical-align:top;text-align:right;font-style:italic;color:#333;margin-top:24px;font-size:14px;}
EOS
    assert equal "$expected" "$(< blog.css)"
    rm blog.css main.css
    return $_shpec_failures ); (( _shpec_failures += $? )) ||:
  end

  it "writes main.css"; (
    stub_command ln

    create_css
    IFS=$'\n' read -rd '' expected <<'EOS' ||:
body{font-family:Georgia,"Times New Roman",Times,serif;margin:0;padding:0;background-color:#F3F3F3;}
        #divbodyholder{padding:5px;background-color:#DDD;width:100%;max-width:874px;margin:24px auto;}
        #divbody{border:solid 1px #ccc;background-color:#fff;padding:0px 48px 24px 48px;top:0;}
        .headerholder{background-color:#f9f9f9;border-top:solid 1px #ccc;border-left:solid 1px #ccc;border-right:solid 1px #ccc;}
        .header{width:100%;max-width:800px;margin:0px auto;padding-top:24px;padding-bottom:8px;}
        .content{margin-bottom:5%;}
        .nomargin{margin:0;}
        .description{margin-top:10px;border-top:solid 1px #666;padding:10px 0;}
        h3{font-size:20pt;width:100%;font-weight:bold;margin-top:32px;margin-bottom:0;}
        .clear{clear:both;}
        #footer{padding-top:10px;border-top:solid 1px #666;color:#333333;text-align:center;font-size:small;font-family:"Courier New","Courier",monospace;}
        a{text-decoration:none;color:#003366 !important;}
        a:visited{text-decoration:none;color:#336699 !important;}
        blockquote{background-color:#f9f9f9;border-left:solid 4px #e9e9e9;margin-left:12px;padding:12px 12px 12px 24px;}
        blockquote img{margin:12px 0px;}
        blockquote iframe{margin:12px 0px;}
EOS
    assert equal "$expected" "$(< main.css)"
    rm blog.css main.css
    return $_shpec_failures ); (( _shpec_failures += $? )) ||:
  end
end

# create_html_page
# create_includes
# date_version_detect
# delete_includes
# disqus_body
# disqus_footer
# edit
# get_html_file_content
# get_post_author
# get_post_title
# global_variables_check
# google_analytics
# is_boilerplate_file
# list_posts
# list_tags
# make_rss
# markdown
# parse_file
# posts_with_tags
# rebuild_all_entries
# rebuild_index
# rebuild_tags
# reset
# tags_in_post
# test_markdown
# twitter
# twitter_card
# usage
# write_entry
