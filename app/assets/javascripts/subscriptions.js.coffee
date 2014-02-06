# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  is_signup = $('#new_subscription').size()
  is_update_card = $('#update_subsciption_billing_card').size()

  if (is_signup || is_update_card)
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))

    if (is_signup > 0)
      Subscription.payment_form_id = "new_subscription"
    else if (is_update_card > 0)
      Subscription.payment_form_id = "update_subsciption_billing_card"

    has_country_select = $('#subscription_country_id').size()

    if (has_country_select > 0)
      $('#subscription_state_id').parent().parent().hide()
      states = $('#subscription_state_id').html()
      $('#subscription_country_id').change ->
        country = $('#subscription_country_id :selected').text()
        escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options = $(states).filter("optgroup[label='#{escaped_country}']").html()
        if options
          $('#subscription_state_id').html(options)
          $('#subscription_state_id').parent().parent().show()
        else
          $('#subscription_state_id').empty()
          $('#subscription_state_id').parent().parent().hide()

    Subscription.setup_payment_form()

    if ($('#confirm_plan').size() > 0)
      $('.modal_confirm_plan').click ->
        plan = $(this).data('plan')
        $('#confirm_plan .js-new_plan-name').text(plan)
        $('#subscription_js_plan').val(plan)
        $('#confirm_plan').modal('show')

Subscription =
  setup_payment_form: ->
    $('#'+Subscription.payment_form_id).submit ->
      $('input[type=submit]').prop('disabled', true)
      if $('#card_number').length
        Subscription.process_card()
        false
      else
        true

  process_card: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, Subscription.handle_stripe_response)

  handle_stripe_response: (status, response) ->
    if status == 200
      $('#subscription_billing_card_token').val(response.id)
      $('#'+Subscription.payment_form_id)[0].submit()
    else
      $('#stripe_error .error_container').text(response.error.message)
      $('#stripe_error').show()
      $('input[type=submit]').prop('disabled', false)