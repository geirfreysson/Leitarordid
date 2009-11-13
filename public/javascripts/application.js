/*
*  Google Ajax tab mode results.
*/

google.load('search', '1');

function OnLoad() {

  // create a tabbed mode search control
  var tabbed = new google.search.SearchControl();

  // create our searchers.  There will now be 3 tabs.
  tabbed.addSearcher(new google.search.LocalSearch());
  tabbed.addSearcher(new google.search.WebSearch());
  tabbed.addSearcher(new google.search.BlogSearch());

  // draw in tabbed layout mode
  var drawOptions = new google.search.DrawOptions();
  drawOptions.setDrawMode(google.search.SearchControl.DRAW_MODE_TABBED);

  // Draw the tabbed view in the content div
  tabbed.draw(document.getElementById("content"), drawOptions);

  // Search!
  tabbed.execute("Subaru STI");
}
google.setOnLoadCallback(OnLoad);​