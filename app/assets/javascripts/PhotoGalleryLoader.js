/**This script utilizes prettyPhoto.
 *http://www.no-margin-for-errors.com/projects/prettyphoto-jquery-lightbox-clone/
 *Other galleries://http://www.shadowbox-js.com
 */

/**
 *This script will make all the necessary preparations for prettyphoto photo galleries.
 *write an rel="prettyPhoto[YourGalleryName]"
 *Prettyphoto can also be used to play other media files including flash
 **/

 
function writePhotoRel(){ 
     //var AlbumTitle= document.getElementsTagName("h1");
     
    //var replacement=AlbumTitle[0].innerHTML;
    var images=document.getElementById("content").getElementsByTagName("img");
    var set=false;
    for(i=0;i<images.length;i++){
        var tempSrc=images[i].src;
        if(images[i].parentNode.nodeName.toLowerCase()=="a"&& (images[i].parentNode.parentNode.className=="photos" || images[i].parentNode.parentNode.className=="photos gallery")){
            images[i].parentNode.setAttribute('rel','prettyPhoto[UCB-IEEE]');
            
            if(!set){
            var curRel=images[i].parentNode.parentNode.rel;
            var newRel="photos"+" gallery";
            images[i].parentNode.parentNode.className+=" gallery";
            set=true;
            }
        }
    }
    
    //document.getElementById("photos").className+="gallery";
}

function doEverything(){
writePhotoRel();
appendChild();
}
window.onload=doEverything;
//window.onload=appendChild;

var line0= "$(document).ready(function(){$(\"area[rel^='prettyPhoto']\").prettyPhoto();$(\".gallery:first a[rel^='prettyPhoto']\").prettyPhoto({animation_speed:'normal',theme:'dark_rounded',slideshow:3000, autoplay_slideshow: true});$(\".gallery:gt(0) a[rel^='prettyPhoto']\").prettyPhoto({animation_speed:'fast',slideshow:10000, hideflash: true});$(\"#custom_content a[rel^='prettyPhoto']:first\").prettyPhoto({ custom_markup: '<div id=\"map_canvas\" style=\"width:260px; height:265px\"></div>',changepicturecallback: function(){ initialize(); }});$(\"#custom_content a[rel^='prettyPhoto']:last\").prettyPhoto({custom_markup: '<div id=\"bsap_1259344\" class=\"bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6\"></div><div id=\"bsap_1237859\" class=\"bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6\" style=\"height:260px\"></div><div id=\"bsap_1251710\" class=\"bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6\"></div>',changepicturecallback: function(){ _bsap.exec(); }});});";




var script = document.createElement("script");
script.type = 'text/javascript';
script.innerHTML =line0;
function appendChild(){
document.body.appendChild( script );
}




			
		
		    


