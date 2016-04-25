var Environment = React.createClass({

    propTypes: {
        environment: React.PropTypes.string,
        version: React.PropTypes.string
    },

    render: function() {
        return (
            <li>{this.props.environment}: {this.props.version}</li>
        );
    }
});

var Application = React.createClass({

    propTypes: {
        name: React.PropTypes.string,
        environmentsArray: React.PropTypes.array
    },

    render: function() {

        var environmentsList = [];
        var _this = this;
        this.props.environmentsArray.forEach(function(applicationEnvironment) {
            var key = _this.props.name + "-" + applicationEnvironment.environment;
            environmentsList.push(<Environment key={key} environment={applicationEnvironment.environment} version={applicationEnvironment.version} />);
        });

        return (
            <div class="block green">
                <h2>{this.props.name}</h2>
                <ul>
                    {environmentsList}
                </ul>
            </div>
        );
    }
});

var Dashboard = React.createClass({
    propTypes: {
        applicationsMap: React.PropTypes.object
    },
    render: function() {

        var applicationsList = [];
        for (var application in this.props.applicationsMap){
            applicationsList.push(<Application key={application} name={application} environmentsArray={this.props.applicationsMap[application]} />);
        };

        return (
            <div class="blocks wrapper">
                {applicationsList}
            </div>
        );
    }
});
