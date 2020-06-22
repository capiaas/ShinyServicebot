HTMLWidgets.widget({

  name: 'shinyservicebot',

  type: 'output',

  factory: function(el, width, height) {

    return {

      renderValue: function(opts) {
        // Render based on caller option
        el.innerHTML = '<div id="servicebot-subscription-portal"></div>'
        // Render html
        servicebotEmbed( opts );
      },
      resize : function(width, height) {
        // the servicebot widget knows how to resize itself automatically
      },

    };

  }

});

function servicebotEmbed(opts) {
  window.servicebotSettings = opts.servicebot_config;
  (function () {
    var s = document.createElement('script');
    s.src = 'https://js.servicebot.io/embeds/servicebot-billing-settings-embed.js';
    s.async = true; 
    s.type = 'text/javascript';
    var x = document.getElementsByTagName('script')[0];
    x.parentNode.insertBefore(s, x);
  })();
}