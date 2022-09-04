SitusDepositDanaView = require './situs-deposit-dana-view'
{CompositeDisposable} = require 'atom'

module.exports = SitusDepositDana =
  situsDepositDanaView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @situsDepositDanaView = new SitusDepositDanaView(state.situsDepositDanaViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @situsDepositDanaView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'situs-deposit-dana:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @situsDepositDanaView.destroy()

  serialize: ->
    situsDepositDanaViewState: @situsDepositDanaView.serialize()

  toggle: ->
    console.log 'SitusDepositDana was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
