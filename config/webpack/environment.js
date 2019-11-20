const { environment } = require('@rails/webpacker')
// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  JQuery: 'jquery',
  jquery: 'jquery',
  'window.Tether': "tether",
  Popper: ['popper.js', 'default'], // for Bootstrap 4
})
)

module.exports = environment
