'use strict';

var webpack = require('webpack'),
  HtmlWebpackPlugin = require('html-webpack-plugin'),
  ExtractTextPlugin = require('extract-text-webpack-plugin'),
  path = require('path'),
  srcPath = path.join(__dirname, 'src');

module.exports = {
  target: 'web',
  cache: true,
  entry: {
    app: [
      'webpack-dev-server/client?http://localhost:3000',
      'webpack/hot/only-dev-server',
      path.join(srcPath, 'app.js')
    ],
    // common: ['react', 'react-router', 'alt', 'react-bootstrap', 'react-router-bootstrap']
  },
  resolve: {
    // root: srcPath,
    extensions: ['', '.js'],
    modulesDirectories: ['node_modules', 'src']
  },
  output: {
    path: path.join(__dirname, 'tmp'),
    publicPath: '',
    filename: '[name].js',
    // library: ['MediaBot', '[name]'],
    // pathInfo: true
  },

  module: {
    loaders: [
      {test: /\.js?$/, loaders: ['react-hot', 'babel?cacheDirectory'], exclude: /node_modules/ },
      {test: /\.(svg|ttf|woff|woff2|eot)$/, loader: 'file?name=[name].[ext]' },
      {test: /\.less$/, loader: ExtractTextPlugin.extract('style', 'css!less') }
      // {test: /\.less$/, loader: 'style!css!less' }
    ]
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin(),
    // new webpack.optimize.CommonsChunkPlugin('common', 'common.js'),
    new ExtractTextPlugin('app.css', { allChunks: true }),
    new HtmlWebpackPlugin({
      inject: true,
      template: 'src/index.html'
    }),
  ],

  // debug: true,
  devtool: 'eval-cheap-module-source-map',
  devServer: {
    contentBase: './tmp',
    historyApiFallback: true
  }
};
