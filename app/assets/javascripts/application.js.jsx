// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require_tree .

var APPLICATIONS = {"ccu":[{"environment":"prod","version":"1.T.4"}],"myApplication2":[{"environment":"Preproduction","version":"2.3.4"},{"environment":"Production","version":"2.3.5"}],"MyApplication":[{"environment":"Production","version":"1.2.4"},{"environment":"Preproduction","version":"1.2.3"}]};

ReactDOM.render(
<Dashboard applicationsMap={APPLICATIONS} />,
    document.getElementById('dashboard')
);
