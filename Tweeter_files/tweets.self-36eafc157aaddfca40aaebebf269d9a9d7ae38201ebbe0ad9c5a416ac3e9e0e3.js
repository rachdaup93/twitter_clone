$(document).ready(function(){
    $("#new-tweets .tweet_description").focus(function(){
        $(this).css('height', '100px')
        setInterval(function(){
        wordCount = $("#new-tweets .tweet_description").val()
        $('#new-tweets .word-count').html(240 - wordCount.length)
        }, 100)
    })
    $("#new-tweets .tweet_description").blur(function(){
        setTimeout(function(){ $("#new-tweets .tweet_description").css('height', '35px') }, 1000)
    })
})
