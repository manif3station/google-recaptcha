(() => {
    let site_key = jQuery('button').data('sitekey');
    let $submitting_form;

    grecaptcha.ready(() => {
        grecaptcha.execute(site_key, {action: 'submit'}).then((token, a, b, c) => {
            jQuery('input[name=gtoken]').val(token);
            jQuery(this).submit();
        })
    });
})();
