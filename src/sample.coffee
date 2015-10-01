ReturnValue = require 'nanocyte-component-return-value'

class Sample extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = Sample
