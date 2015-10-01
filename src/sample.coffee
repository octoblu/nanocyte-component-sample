ReturnValue = require 'nanocyte-component-return-value'

class Sample extends ReturnValue
  constructor: (options={}, dependencies={}) ->
    super
    {@_} = dependencies
    @_ ?= require 'lodash'

  onEnvelope: (envelope) =>
    {key, value} = envelope.config
    "#{key}": @_.sample(value)

module.exports = Sample
