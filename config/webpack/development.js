process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig(), {
  // ここから追加
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js'
    }
  }
}

