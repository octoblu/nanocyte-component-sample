ReturnValue = require 'nanocyte-component-return-value'
Sample = require '../src/sample'

describe 'Sample', ->
  beforeEach ->
    @_ = sample: sinon.stub()

    @sut = new Sample {}, _: @_

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      beforeEach ->
        @_.sample.returns 'calico'
      it 'should return a random part of the message', ->
        envelope =
          config:
            key: 'cats'
            value: ['tabby', 'siamese', 'calico', 'ragdoll', 'sphinx']
        expect(@sut.onEnvelope  envelope).to.deep.equal 'cats': 'calico'

    describe 'when called with a different envelope', ->
      beforeEach ->
        @_.sample.returns 'blood-drawn'
      it 'should return a random part of the new message', ->
        envelope =
          config:
            key: 'evil-edison'
            value: ['mad-inventor', 'blood-drawn', 'elicit-trust-in-others', 'MRI']
        expect(@sut.onEnvelope  envelope).to.deep.equal 'evil-edison': 'blood-drawn'
