window.onload = function() {
   console.log("Are you ready?");

   var cheesy = document.getElementById("add-cheese");

   cheesy.onclick = function(event){
      alert("Now we're ready!");
   };

   var buildBackground = function(){
      var element = document.getElementById("lightbox");

      element.style.backgroundImage = "url('http://placekitten.com/" + (Math.floor(Math.random() * (500 - 300)) + 300).toString() + "/" + (Math.floor(Math.random() * (500 - 300)) + 300).toString() + "')";

   };
   setInterval(buildBackground, 3000);
};

   var songs = document.getElementsByTagName("AUDIO");
