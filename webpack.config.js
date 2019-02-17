module.exports = {
    "mode": "development",
    "entry": "./frontend/app.jsx",
    "output": {
        "path": __dirname+'/app/assets/javascripts',
        "filename": "bundle.js"
    },
    "devtool": "source-map",
    "module": {
        "rules": [
            {
                "test": /\.(js|jsx)$/,
                "exclude": /node_modules/,
                "use": {
                    "loader": "babel-loader",
                    "options": {
                        "presets": [
                            "env",
                            "react"
                        ]
                    }
                }
            }
        ]
    }
}