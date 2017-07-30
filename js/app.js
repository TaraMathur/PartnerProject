// Wait for the DOM to load
window.onload = function() {
  // Create popcorn instance from the YouTube video and insert it into the .video div
  var pop = Popcorn.youtube(".video", "http//www.youtube.com/watch?v=x88Z5txBc7w");

  // Play the video automatically
  pop.play();
};