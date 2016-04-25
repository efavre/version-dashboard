var APPLICATIONS = {};
var APIEndpoints = {DEPLOYS:  "/deploys"};

$.ajax(APIEndpoints.DEPLOYS, {
    success: function(data) {
        APPLICATIONS = data;
        ReactDOM.render(
            <Dashboard applicationsMap={APPLICATIONS} />,
            document.getElementById('dashboard')
        );
    },
    error: function() {
        $('#dashboard').text('An error occurred');
    }
});
