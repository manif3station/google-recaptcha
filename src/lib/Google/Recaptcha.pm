package Google::Recaptcha;

use Dancer2 appname => 'Web';
use Google::reCAPTCHA::v3;

my $key    = "$ENV{RECAPTCHA_SITE_KEY}";
my $secret = "$ENV{RECAPTCHA_SECRET_KEY}";

hook before_template_render => sub {
    my ($stash) = @_;
    $stash->{RECAPTCHA_SITE_KEY} = $key;
};

sub check {
    my $grc = Google::reCAPTCHA::v3->new(
        {
            -secret => $secret,
        }
    );

    my $check = $grc->request( { -response => params->{gtoken} // '' } );

    return $check->{success} ? 1 : 0;
}

1;
