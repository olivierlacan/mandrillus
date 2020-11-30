# =============================================================================
#
# NOTICE: Per the Apache 2.0 license, this file was modified from the original
# mandrill-api gem which was forked since it was no longer maintained as of
# 2018-10-08. A history of all changes made since the last released version
# prior to the fork can be found at the following URL:
# - https://github.com/olivierlacan/mandrillus/compare/1.0.54..master
#
# Version 2.0.0 is the first post-fork version of this new project which carries
# the same license as the original, as listed in the LICENSE file at the root of
# this project.
#
# =============================================================================
#
module Mandrill
    class Error < StandardError
    end
    class ValidationError < Error
    end
    class InvalidKeyError < Error
    end
    class PaymentRequiredError < Error
    end
    class UnknownSubaccountError < Error
    end
    class UnknownTemplateError < Error
    end
    class ServiceUnavailableError < Error
    end
    class UnknownMessageError < Error
    end
    class InvalidTagNameError < Error
    end
    class InvalidRejectError < Error
    end
    class UnknownSenderError < Error
    end
    class UnknownUrlError < Error
    end
    class UnknownTrackingDomainError < Error
    end
    class InvalidTemplateError < Error
    end
    class UnknownWebhookError < Error
    end
    class UnknownInboundDomainError < Error
    end
    class UnknownInboundRouteError < Error
    end
    class UnknownExportError < Error
    end
    class IPProvisionLimitError < Error
    end
    class UnknownPoolError < Error
    end
    class NoSendingHistoryError < Error
    end
    class PoorReputationError < Error
    end
    class UnknownIPError < Error
    end
    class InvalidEmptyDefaultPoolError < Error
    end
    class InvalidDeleteDefaultPoolError < Error
    end
    class InvalidDeleteNonEmptyPoolError < Error
    end
    class InvalidCustomDNSError < Error
    end
    class InvalidCustomDNSPendingError < Error
    end
    class MetadataFieldLimitError < Error
    end
    class UnknownMetadataFieldError < Error
    end
end

