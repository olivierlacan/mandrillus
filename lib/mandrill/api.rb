module Mandrill


    class Templates
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Add a new template
        # @param [String] name the name for the new template - must be unique
        # @param [String] from_email a default sending address for emails sent using this template
        # @param [String] from_name a default from name to be used
        # @param [String] subject a default subject line to be used
        # @param [String] code the HTML code for the template with mc:edit attributes for the editable elements
        # @param [String] text a default text part to be used when sending with this template
        # @param [Boolean] publish set to false to add a draft template without publishing
        # @param [Array] labels an optional array of up to 10 labels to use for filtering templates
        #     - [String] labels[] a single label
        # @return [Hash] the information saved about the new template
        #     - [String] slug the immutable unique code name of the template
        #     - [String] name the name of the template
        #     - [Array] labels the list of labels applied to the template
        #         - [String] labels[] a single label
        #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
        #     - [String] subject the subject line of the template, if provided - draft version
        #     - [String] from_email the default sender address for the template, if provided - draft version
        #     - [String] from_name the default sender from name for the template, if provided - draft version
        #     - [String] text the default text part of messages sent with the template, if provided - draft version
        #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
        #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
        #     - [String] publish_subject the subject line of the template, if provided
        #     - [String] publish_from_email the default sender address for the template, if provided
        #     - [String] publish_from_name the default sender from name for the template, if provided
        #     - [String] publish_text the default text part of messages sent with the template, if provided
        #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
        #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
        def add(name, from_email=nil, from_name=nil, subject=nil, code=nil, text=nil, publish=true, labels=[])
            _params = {:name => name, :from_email => from_email, :from_name => from_name, :subject => subject, :code => code, :text => text, :publish => publish, :labels => labels}
            return @master.call 'templates/add', _params
        end

        # Get the information for an existing template
        # @param [String] name the immutable name of an existing template
        # @return [Hash] the requested template information
        #     - [String] slug the immutable unique code name of the template
        #     - [String] name the name of the template
        #     - [Array] labels the list of labels applied to the template
        #         - [String] labels[] a single label
        #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
        #     - [String] subject the subject line of the template, if provided - draft version
        #     - [String] from_email the default sender address for the template, if provided - draft version
        #     - [String] from_name the default sender from name for the template, if provided - draft version
        #     - [String] text the default text part of messages sent with the template, if provided - draft version
        #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
        #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
        #     - [String] publish_subject the subject line of the template, if provided
        #     - [String] publish_from_email the default sender address for the template, if provided
        #     - [String] publish_from_name the default sender from name for the template, if provided
        #     - [String] publish_text the default text part of messages sent with the template, if provided
        #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
        #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
        def info(name)
            _params = {:name => name}
            return @master.call 'templates/info', _params
        end

        # Update the code for an existing template. If null is provided for any fields, the values will remain unchanged.
        # @param [String] name the immutable name of an existing template
        # @param [String] from_email the new default sending address
        # @param [String] from_name the new default from name
        # @param [String] subject the new default subject line
        # @param [String] code the new code for the template
        # @param [String] text the new default text part to be used
        # @param [Boolean] publish set to false to update the draft version of the template without publishing
        # @param [Array] labels an optional array of up to 10 labels to use for filtering templates
        #     - [String] labels[] a single label
        # @return [Hash] the template that was updated
        #     - [String] slug the immutable unique code name of the template
        #     - [String] name the name of the template
        #     - [Array] labels the list of labels applied to the template
        #         - [String] labels[] a single label
        #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
        #     - [String] subject the subject line of the template, if provided - draft version
        #     - [String] from_email the default sender address for the template, if provided - draft version
        #     - [String] from_name the default sender from name for the template, if provided - draft version
        #     - [String] text the default text part of messages sent with the template, if provided - draft version
        #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
        #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
        #     - [String] publish_subject the subject line of the template, if provided
        #     - [String] publish_from_email the default sender address for the template, if provided
        #     - [String] publish_from_name the default sender from name for the template, if provided
        #     - [String] publish_text the default text part of messages sent with the template, if provided
        #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
        #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
        def update(name, from_email=nil, from_name=nil, subject=nil, code=nil, text=nil, publish=true, labels=nil)
            _params = {:name => name, :from_email => from_email, :from_name => from_name, :subject => subject, :code => code, :text => text, :publish => publish, :labels => labels}
            return @master.call 'templates/update', _params
        end

        # Publish the content for the template. Any new messages sent using this template will start using the content that was previously in draft.
        # @param [String] name the immutable name of an existing template
        # @return [Hash] the template that was published
        #     - [String] slug the immutable unique code name of the template
        #     - [String] name the name of the template
        #     - [Array] labels the list of labels applied to the template
        #         - [String] labels[] a single label
        #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
        #     - [String] subject the subject line of the template, if provided - draft version
        #     - [String] from_email the default sender address for the template, if provided - draft version
        #     - [String] from_name the default sender from name for the template, if provided - draft version
        #     - [String] text the default text part of messages sent with the template, if provided - draft version
        #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
        #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
        #     - [String] publish_subject the subject line of the template, if provided
        #     - [String] publish_from_email the default sender address for the template, if provided
        #     - [String] publish_from_name the default sender from name for the template, if provided
        #     - [String] publish_text the default text part of messages sent with the template, if provided
        #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
        #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
        def publish(name)
            _params = {:name => name}
            return @master.call 'templates/publish', _params
        end

        # Delete a template
        # @param [String] name the immutable name of an existing template
        # @return [Hash] the template that was deleted
        #     - [String] slug the immutable unique code name of the template
        #     - [String] name the name of the template
        #     - [Array] labels the list of labels applied to the template
        #         - [String] labels[] a single label
        #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
        #     - [String] subject the subject line of the template, if provided - draft version
        #     - [String] from_email the default sender address for the template, if provided - draft version
        #     - [String] from_name the default sender from name for the template, if provided - draft version
        #     - [String] text the default text part of messages sent with the template, if provided - draft version
        #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
        #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
        #     - [String] publish_subject the subject line of the template, if provided
        #     - [String] publish_from_email the default sender address for the template, if provided
        #     - [String] publish_from_name the default sender from name for the template, if provided
        #     - [String] publish_text the default text part of messages sent with the template, if provided
        #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
        #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
        def delete(name)
            _params = {:name => name}
            return @master.call 'templates/delete', _params
        end

        # Return a list of all the templates available to this user
        # @param [String] label an optional label to filter the templates
        # @return [Array] an array of structs with information about each template
        #     - [Hash] return[] the information on each template in the account
        #         - [String] slug the immutable unique code name of the template
        #         - [String] name the name of the template
        #         - [Array] labels the list of labels applied to the template
        #             - [String] labels[] a single label
        #         - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
        #         - [String] subject the subject line of the template, if provided - draft version
        #         - [String] from_email the default sender address for the template, if provided - draft version
        #         - [String] from_name the default sender from name for the template, if provided - draft version
        #         - [String] text the default text part of messages sent with the template, if provided - draft version
        #         - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
        #         - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
        #         - [String] publish_subject the subject line of the template, if provided
        #         - [String] publish_from_email the default sender address for the template, if provided
        #         - [String] publish_from_name the default sender from name for the template, if provided
        #         - [String] publish_text the default text part of messages sent with the template, if provided
        #         - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
        #         - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
        def list(label=nil)
            _params = {:label => label}
            return @master.call 'templates/list', _params
        end

        # Return the recent history (hourly stats for the last 30 days) for a template
        # @param [String] name the name of an existing template
        # @return [Array] the array of history information
        #     - [Hash] return[] the stats for a single hour
        #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the number of emails that were sent during the hour
        #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
        #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
        #         - [Integer] rejects the number of emails that were rejected during the hour
        #         - [Integer] complaints the number of spam complaints received during the hour
        #         - [Integer] opens the number of emails opened during the hour
        #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
        #         - [Integer] clicks the number of tracked URLs clicked during the hour
        #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
        def time_series(name)
            _params = {:name => name}
            return @master.call 'templates/time-series', _params
        end

        # Inject content and optionally merge fields into a template, returning the HTML that results
        # @param [String] template_name the immutable name of a template that exists in the user's account
        # @param [Array] template_content an array of template content to render.  Each item in the array should be a struct with two keys - name: the name of the content block to set the content for, and content: the actual content to put into the block
        #     - [Hash] template_content[] the injection of a single piece of content into a single editable region
        #         - [String] name the name of the mc:edit editable region to inject into
        #         - [String] content the content to inject
        # @param [Array] merge_vars optional merge variables to use for injecting merge field content.  If this is not provided, no merge fields will be replaced.
        #     - [Hash] merge_vars[] a single merge variable
        #         - [String] name the merge variable's name. Merge variable names are case-insensitive and may not start with _
        #         - [String] content the merge variable's content
        # @return [Hash] the result of rendering the given template with the content and merge field values injected
        #     - [String] html the rendered HTML as a string
        def render(template_name, template_content, merge_vars=nil)
            _params = {:template_name => template_name, :template_content => template_content, :merge_vars => merge_vars}
            return @master.call 'templates/render', _params
        end

    end
    class Exports
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Returns information about an export job. If the export job's state is 'complete', the returned data will include a URL you can use to fetch the results. Every export job produces a zip archive, but the format of the archive is distinct for each job type. The api calls that initiate exports include more details about the output format for that job type.
        # @param [String] id an export job identifier
        # @return [Hash] the information about the export
        #     - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
        #     - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] type the type of the export job - activity, reject, or whitelist
        #     - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] state the export job's state - waiting, working, complete, error, or expired.
        #     - [String] result_url the url for the export job's results, if the job is completed.
        def info(id)
            _params = {:id => id}
            return @master.call 'exports/info', _params
        end

        # Returns a list of your exports.
        # @return [Array] the account's exports
        #     - [Hash] return[] the individual export info
        #         - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
        #         - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] type the type of the export job - activity, reject, or whitelist
        #         - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] state the export job's state - waiting, working, complete, error, or expired.
        #         - [String] result_url the url for the export job's results, if the job is completed.
        def list()
            _params = {}
            return @master.call 'exports/list', _params
        end

        # Begins an export of your rejection blacklist. The blacklist will be exported to a zip archive containing a single file named rejects.csv that includes the following fields: email, reason, detail, created_at, expires_at, last_event_at, expires_at.
        # @param [String] notify_email an optional email address to notify when the export job has finished.
        # @return [Hash] information about the rejects export job that was started
        #     - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
        #     - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] type the type of the export job
        #     - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format, or null for jobs that have not run
        #     - [String] state the export job's state
        #     - [String] result_url the url for the export job's results, if the job is complete
        def rejects(notify_email=nil)
            _params = {:notify_email => notify_email}
            return @master.call 'exports/rejects', _params
        end

        # Begins an export of your rejection whitelist. The whitelist will be exported to a zip archive containing a single file named whitelist.csv that includes the following fields: email, detail, created_at.
        # @param [String] notify_email an optional email address to notify when the export job has finished.
        # @return [Hash] information about the whitelist export job that was started
        #     - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
        #     - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] type the type of the export job
        #     - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format, or null for jobs that have not run
        #     - [String] state the export job's state
        #     - [String] result_url the url for the export job's results, if the job is complete
        def whitelist(notify_email=nil)
            _params = {:notify_email => notify_email}
            return @master.call 'exports/whitelist', _params
        end

        # Begins an export of your activity history. The activity will be exported to a zip archive containing a single file named activity.csv in the same format as you would be able to export from your account's activity view. It includes the following fields: Date, Email Address, Sender, Subject, Status, Tags, Opens, Clicks, Bounce Detail. If you have configured any custom metadata fields, they will be included in the exported data.
        # @param [String] notify_email an optional email address to notify when the export job has finished
        # @param [String] date_from start date as a UTC string in YYYY-MM-DD HH:MM:SS format
        # @param [String] date_to end date as a UTC string in YYYY-MM-DD HH:MM:SS format
        # @param [Array] tags an array of tag names to narrow the export to; will match messages that contain ANY of the tags
        #     - [String] tags[] a tag name
        # @param [Array] senders an array of senders to narrow the export to
        #     - [String] senders[] a sender address
        # @param [Array] states an array of states to narrow the export to; messages with ANY of the states will be included
        #     - [String] states[] a message state
        # @param [Array] api_keys an array of api keys to narrow the export to; messsagse sent with ANY of the keys will be included
        #     - [String] api_keys[] an API key associated with your account
        # @return [Hash] information about the activity export job that was started
        #     - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
        #     - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] type the type of the export job
        #     - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format, or null for jobs that have not run
        #     - [String] state the export job's state
        #     - [String] result_url the url for the export job's results, if the job is complete
        def activity(notify_email=nil, date_from=nil, date_to=nil, tags=nil, senders=nil, states=nil, api_keys=nil)
            _params = {:notify_email => notify_email, :date_from => date_from, :date_to => date_to, :tags => tags, :senders => senders, :states => states, :api_keys => api_keys}
            return @master.call 'exports/activity', _params
        end

    end
    class Users
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Return the information about the API-connected user
        # @return [Hash] the user information including username, key, reputation, quota, and historical sending stats
        #     - [String] username the username of the user (used for SMTP authentication)
        #     - [String] created_at the date and time that the user's Mandrill account was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] public_id a unique, permanent identifier for this user
        #     - [Integer] reputation the reputation of the user on a scale from 0 to 100, with 75 generally being a "good" reputation
        #     - [Integer] hourly_quota the maximum number of emails Mandrill will deliver for this user each hour.  Any emails beyond that will be accepted and queued for later delivery.  Users with higher reputations will have higher hourly quotas
        #     - [Integer] backlog the number of emails that are queued for delivery due to exceeding your monthly or hourly quotas
        #     - [Hash] stats an aggregate summary of the account's sending stats
        #         - [Hash] today stats for this user so far today
        #             - [Integer] sent the number of emails sent for this user so far today
        #             - [Integer] hard_bounces the number of emails hard bounced for this user so far today
        #             - [Integer] soft_bounces the number of emails soft bounced for this user so far today
        #             - [Integer] rejects the number of emails rejected for sending this user so far today
        #             - [Integer] complaints the number of spam complaints for this user so far today
        #             - [Integer] unsubs the number of unsubscribes for this user so far today
        #             - [Integer] opens the number of times emails have been opened for this user so far today
        #             - [Integer] unique_opens the number of unique opens for emails sent for this user so far today
        #             - [Integer] clicks the number of URLs that have been clicked for this user so far today
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user so far today
        #         - [Hash] last_7_days stats for this user in the last 7 days
        #             - [Integer] sent the number of emails sent for this user in the last 7 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this user in the last 7 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this user in the last 7 days
        #             - [Integer] rejects the number of emails rejected for sending this user in the last 7 days
        #             - [Integer] complaints the number of spam complaints for this user in the last 7 days
        #             - [Integer] unsubs the number of unsubscribes for this user in the last 7 days
        #             - [Integer] opens the number of times emails have been opened for this user in the last 7 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this user in the last 7 days
        #             - [Integer] clicks the number of URLs that have been clicked for this user in the last 7 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user in the last 7 days
        #         - [Hash] last_30_days stats for this user in the last 30 days
        #             - [Integer] sent the number of emails sent for this user in the last 30 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this user in the last 30 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this user in the last 30 days
        #             - [Integer] rejects the number of emails rejected for sending this user in the last 30 days
        #             - [Integer] complaints the number of spam complaints for this user in the last 30 days
        #             - [Integer] unsubs the number of unsubscribes for this user in the last 30 days
        #             - [Integer] opens the number of times emails have been opened for this user in the last 30 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this user in the last 30 days
        #             - [Integer] clicks the number of URLs that have been clicked for this user in the last 30 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user in the last 30 days
        #         - [Hash] last_60_days stats for this user in the last 60 days
        #             - [Integer] sent the number of emails sent for this user in the last 60 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this user in the last 60 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this user in the last 60 days
        #             - [Integer] rejects the number of emails rejected for sending this user in the last 60 days
        #             - [Integer] complaints the number of spam complaints for this user in the last 60 days
        #             - [Integer] unsubs the number of unsubscribes for this user in the last 60 days
        #             - [Integer] opens the number of times emails have been opened for this user in the last 60 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this user in the last 60 days
        #             - [Integer] clicks the number of URLs that have been clicked for this user in the last 60 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user in the last 60 days
        #         - [Hash] last_90_days stats for this user in the last 90 days
        #             - [Integer] sent the number of emails sent for this user in the last 90 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this user in the last 90 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this user in the last 90 days
        #             - [Integer] rejects the number of emails rejected for sending this user in the last 90 days
        #             - [Integer] complaints the number of spam complaints for this user in the last 90 days
        #             - [Integer] unsubs the number of unsubscribes for this user in the last 90 days
        #             - [Integer] opens the number of times emails have been opened for this user in the last 90 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this user in the last 90 days
        #             - [Integer] clicks the number of URLs that have been clicked for this user in the last 90 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user in the last 90 days
        #         - [Hash] all_time stats for the lifetime of the user's account
        #             - [Integer] sent the number of emails sent in the lifetime of the user's account
        #             - [Integer] hard_bounces the number of emails hard bounced in the lifetime of the user's account
        #             - [Integer] soft_bounces the number of emails soft bounced in the lifetime of the user's account
        #             - [Integer] rejects the number of emails rejected for sending this user so far today
        #             - [Integer] complaints the number of spam complaints in the lifetime of the user's account
        #             - [Integer] unsubs the number of unsubscribes in the lifetime of the user's account
        #             - [Integer] opens the number of times emails have been opened in the lifetime of the user's account
        #             - [Integer] unique_opens the number of unique opens for emails sent in the lifetime of the user's account
        #             - [Integer] clicks the number of URLs that have been clicked in the lifetime of the user's account
        #             - [Integer] unique_clicks the number of unique clicks for emails sent in the lifetime of the user's account
        def info()
            _params = {}
            return @master.call 'users/info', _params
        end

        # Validate an API key and respond to a ping (anal JSON parser version)
        # @return [Hash] a struct with one key "PING" with a static value "PONG!"
        def ping()
            _params = {}
            return @master.call 'users/ping2', _params
        end

        # Return the senders that have tried to use this account, both verified and unverified
        # @return [Array] an array of sender data, one for each sending addresses used by the account
        #     - [Hash] return[] the information on each sending address in the account
        #         - [String] address the sender's email address
        #         - [String] created_at the date and time that the sender was first seen by Mandrill as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the total number of messages sent by this sender
        #         - [Integer] hard_bounces the total number of hard bounces by messages by this sender
        #         - [Integer] soft_bounces the total number of soft bounces by messages by this sender
        #         - [Integer] rejects the total number of rejected messages by this sender
        #         - [Integer] complaints the total number of spam complaints received for messages by this sender
        #         - [Integer] unsubs the total number of unsubscribe requests received for messages by this sender
        #         - [Integer] opens the total number of times messages by this sender have been opened
        #         - [Integer] clicks the total number of times tracked URLs in messages by this sender have been clicked
        #         - [Integer] unique_opens the number of unique opens for emails sent for this sender
        #         - [Integer] unique_clicks the number of unique clicks for emails sent for this sender
        def senders()
            _params = {}
            return @master.call 'users/senders', _params
        end

    end
    class Rejects
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Adds an email to your email rejection blacklist. Addresses that you add manually will never expire and there is no reputation penalty for removing them from your blacklist. Attempting to blacklist an address that has been whitelisted will have no effect.
        # @param [String] email an email address to block
        # @param [String] comment an optional comment describing the rejection
        # @param [String] subaccount an optional unique identifier for the subaccount to limit the blacklist entry
        # @return [Hash] a status object containing the address and the result of the operation
        #     - [String] email the email address you provided
        #     - [Boolean] added whether the operation succeeded
        def add(email, comment=nil, subaccount=nil)
            _params = {:email => email, :comment => comment, :subaccount => subaccount}
            return @master.call 'rejects/add', _params
        end

        # Retrieves your email rejection blacklist. You can provide an email address to limit the results. Returns up to 1000 results. By default, entries that have expired are excluded from the results; set include_expired to true to include them.
        # @param [String] email an optional email address to search by
        # @param [Boolean] include_expired whether to include rejections that have already expired.
        # @param [String] subaccount an optional unique identifier for the subaccount to limit the blacklist
        # @return [Array] Up to 1000 rejection entries
        #     - [Hash] return[] the information for each rejection blacklist entry
        #         - [String] email the email that is blocked
        #         - [String] reason the type of event (hard-bounce, soft-bounce, spam, unsub, custom) that caused this rejection
        #         - [String] detail extended details about the event, such as the SMTP diagnostic for bounces or the comment for manually-created rejections
        #         - [String] created_at when the email was added to the blacklist
        #         - [String] last_event_at the timestamp of the most recent event that either created or renewed this rejection
        #         - [String] expires_at when the blacklist entry will expire (this may be in the past)
        #         - [Boolean] expired whether the blacklist entry has expired
        #         - [Hash] sender the sender that this blacklist entry applies to, or null if none.
        #             - [String] address the sender's email address
        #             - [String] created_at the date and time that the sender was first seen by Mandrill as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #             - [Integer] sent the total number of messages sent by this sender
        #             - [Integer] hard_bounces the total number of hard bounces by messages by this sender
        #             - [Integer] soft_bounces the total number of soft bounces by messages by this sender
        #             - [Integer] rejects the total number of rejected messages by this sender
        #             - [Integer] complaints the total number of spam complaints received for messages by this sender
        #             - [Integer] unsubs the total number of unsubscribe requests received for messages by this sender
        #             - [Integer] opens the total number of times messages by this sender have been opened
        #             - [Integer] clicks the total number of times tracked URLs in messages by this sender have been clicked
        #             - [Integer] unique_opens the number of unique opens for emails sent for this sender
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender
        #         - [String] subaccount the subaccount that this blacklist entry applies to, or null if none.
        def list(email=nil, include_expired=false, subaccount=nil)
            _params = {:email => email, :include_expired => include_expired, :subaccount => subaccount}
            return @master.call 'rejects/list', _params
        end

        # Deletes an email rejection. There is no limit to how many rejections you can remove from your blacklist, but keep in mind that each deletion has an affect on your reputation.
        # @param [String] email an email address
        # @param [String] subaccount an optional unique identifier for the subaccount to limit the blacklist deletion
        # @return [Hash] a status object containing the address and whether the deletion succeeded.
        #     - [String] email the email address that was removed from the blacklist
        #     - [Boolean] deleted whether the address was deleted successfully.
        #     - [String] subaccount the subaccount blacklist that the address was removed from, if any
        def delete(email, subaccount=nil)
            _params = {:email => email, :subaccount => subaccount}
            return @master.call 'rejects/delete', _params
        end

    end
    class Inbound
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # List the domains that have been configured for inbound delivery
        # @return [Array] the inbound domains associated with the account
        #     - [Hash] return[] the individual domain info
        #         - [String] domain the domain name that is accepting mail
        #         - [String] created_at the date and time that the inbound domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [Boolean] valid_mx true if this inbound domain has successfully set up an MX record to deliver mail to the Mandrill servers
        def domains()
            _params = {}
            return @master.call 'inbound/domains', _params
        end

        # Add an inbound domain to your account
        # @param [String] domain a domain name
        # @return [Hash] information about the domain
        #     - [String] domain the domain name that is accepting mail
        #     - [String] created_at the date and time that the inbound domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Boolean] valid_mx true if this inbound domain has successfully set up an MX record to deliver mail to the Mandrill servers
        def add_domain(domain)
            _params = {:domain => domain}
            return @master.call 'inbound/add-domain', _params
        end

        # Check the MX settings for an inbound domain. The domain must have already been added with the add-domain call
        # @param [String] domain an existing inbound domain
        # @return [Hash] information about the inbound domain
        #     - [String] domain the domain name that is accepting mail
        #     - [String] created_at the date and time that the inbound domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Boolean] valid_mx true if this inbound domain has successfully set up an MX record to deliver mail to the Mandrill servers
        def check_domain(domain)
            _params = {:domain => domain}
            return @master.call 'inbound/check-domain', _params
        end

        # Delete an inbound domain from the account. All mail will stop routing for this domain immediately.
        # @param [String] domain an existing inbound domain
        # @return [Hash] information about the deleted domain
        #     - [String] domain the domain name that is accepting mail
        #     - [String] created_at the date and time that the inbound domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Boolean] valid_mx true if this inbound domain has successfully set up an MX record to deliver mail to the Mandrill servers
        def delete_domain(domain)
            _params = {:domain => domain}
            return @master.call 'inbound/delete-domain', _params
        end

        # List the mailbox routes defined for an inbound domain
        # @param [String] domain the domain to check
        # @return [Array] the routes associated with the domain
        #     - [Hash] return[] the individual mailbox route
        #         - [String] id the unique identifier of the route
        #         - [String] pattern the search pattern that the mailbox name should match
        #         - [String] url the webhook URL where inbound messages will be published
        def routes(domain)
            _params = {:domain => domain}
            return @master.call 'inbound/routes', _params
        end

        # Add a new mailbox route to an inbound domain
        # @param [String] domain an existing inbound domain
        # @param [String] pattern the search pattern that the mailbox name should match
        # @param [String] url the webhook URL where the inbound messages will be published
        # @return [Hash] the added mailbox route information
        #     - [String] id the unique identifier of the route
        #     - [String] pattern the search pattern that the mailbox name should match
        #     - [String] url the webhook URL where inbound messages will be published
        def add_route(domain, pattern, url)
            _params = {:domain => domain, :pattern => pattern, :url => url}
            return @master.call 'inbound/add-route', _params
        end

        # Update the pattern or webhook of an existing inbound mailbox route. If null is provided for any fields, the values will remain unchanged.
        # @param [String] id the unique identifier of an existing mailbox route
        # @param [String] pattern the search pattern that the mailbox name should match
        # @param [String] url the webhook URL where the inbound messages will be published
        # @return [Hash] the updated mailbox route information
        #     - [String] id the unique identifier of the route
        #     - [String] pattern the search pattern that the mailbox name should match
        #     - [String] url the webhook URL where inbound messages will be published
        def update_route(id, pattern=nil, url=nil)
            _params = {:id => id, :pattern => pattern, :url => url}
            return @master.call 'inbound/update-route', _params
        end

        # Delete an existing inbound mailbox route
        # @param [String] id the unique identifier of an existing route
        # @return [Hash] the deleted mailbox route information
        #     - [String] id the unique identifier of the route
        #     - [String] pattern the search pattern that the mailbox name should match
        #     - [String] url the webhook URL where inbound messages will be published
        def delete_route(id)
            _params = {:id => id}
            return @master.call 'inbound/delete-route', _params
        end

        # Take a raw MIME document destined for a domain with inbound domains set up, and send it to the inbound hook exactly as if it had been sent over SMTP
        # @param [String] raw_message the full MIME document of an email message
        # @param [Array, nil] to optionally define the recipients to receive the message - otherwise we'll use the To, Cc, and Bcc headers provided in the document
        #     - [String] to[] the email address of the recipient
        # @param [String] mail_from the address specified in the MAIL FROM stage of the SMTP conversation. Required for the SPF check.
        # @param [String] helo the identification provided by the client mta in the MTA state of the SMTP conversation. Required for the SPF check.
        # @param [String] client_address the remote MTA's ip address. Optional; required for the SPF check.
        # @return [Array] an array of the information for each recipient in the message (usually one) that matched an inbound route
        #     - [Hash] return[] the individual recipient information
        #         - [String] email the email address of the matching recipient
        #         - [String] pattern the mailbox route pattern that the recipient matched
        #         - [String] url the webhook URL that the message was posted to
        def send_raw(raw_message, to=nil, mail_from=nil, helo=nil, client_address=nil)
            _params = {:raw_message => raw_message, :to => to, :mail_from => mail_from, :helo => helo, :client_address => client_address}
            return @master.call 'inbound/send-raw', _params
        end

    end
    class Tags
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Return all of the user-defined tag information
        # @return [Array] a list of user-defined tags
        #     - [Hash] return[] a user-defined tag
        #         - [String] tag the actual tag as a string
        #         - [Integer] reputation the tag's current reputation on a scale from 0 to 100.
        #         - [Integer] sent the total number of messages sent with this tag
        #         - [Integer] hard_bounces the total number of hard bounces by messages with this tag
        #         - [Integer] soft_bounces the total number of soft bounces by messages with this tag
        #         - [Integer] rejects the total number of rejected messages with this tag
        #         - [Integer] complaints the total number of spam complaints received for messages with this tag
        #         - [Integer] unsubs the total number of unsubscribe requests received for messages with this tag
        #         - [Integer] opens the total number of times messages with this tag have been opened
        #         - [Integer] clicks the total number of times tracked URLs in messages with this tag have been clicked
        #         - [Integer] unique_opens the number of unique opens for emails sent with this tag
        #         - [Integer] unique_clicks the number of unique clicks for emails sent with this tag
        def list()
            _params = {}
            return @master.call 'tags/list', _params
        end

        # Deletes a tag permanently. Deleting a tag removes the tag from any messages that have been sent, and also deletes the tag's stats. There is no way to undo this operation, so use it carefully.
        # @param [String] tag a tag name
        # @return [Hash] the tag that was deleted
        #     - [String] tag the actual tag as a string
        #     - [Integer] reputation the tag's current reputation on a scale from 0 to 100.
        #     - [Integer] sent the total number of messages sent with this tag
        #     - [Integer] hard_bounces the total number of hard bounces by messages with this tag
        #     - [Integer] soft_bounces the total number of soft bounces by messages with this tag
        #     - [Integer] rejects the total number of rejected messages with this tag
        #     - [Integer] complaints the total number of spam complaints received for messages with this tag
        #     - [Integer] unsubs the total number of unsubscribe requests received for messages with this tag
        #     - [Integer] opens the total number of times messages with this tag have been opened
        #     - [Integer] clicks the total number of times tracked URLs in messages with this tag have been clicked
        #     - [Integer] unique_opens the number of unique opens for emails sent with this tag
        #     - [Integer] unique_clicks the number of unique clicks for emails sent with this tag
        def delete(tag)
            _params = {:tag => tag}
            return @master.call 'tags/delete', _params
        end

        # Return more detailed information about a single tag, including aggregates of recent stats
        # @param [String] tag an existing tag name
        # @return [Hash] the detailed information on the tag
        #     - [String] tag the actual tag as a string
        #     - [Integer] sent the total number of messages sent with this tag
        #     - [Integer] hard_bounces the total number of hard bounces by messages with this tag
        #     - [Integer] soft_bounces the total number of soft bounces by messages with this tag
        #     - [Integer] rejects the total number of rejected messages with this tag
        #     - [Integer] complaints the total number of spam complaints received for messages with this tag
        #     - [Integer] unsubs the total number of unsubscribe requests received for messages with this tag
        #     - [Integer] opens the total number of times messages with this tag have been opened
        #     - [Integer] clicks the total number of times tracked URLs in messages with this tag have been clicked
        #     - [Hash] stats an aggregate summary of the tag's sending stats
        #         - [Hash] today stats with this tag so far today
        #             - [Integer] sent the number of emails sent with this tag so far today
        #             - [Integer] hard_bounces the number of emails hard bounced with this tag so far today
        #             - [Integer] soft_bounces the number of emails soft bounced with this tag so far today
        #             - [Integer] rejects the number of emails rejected for sending this tag so far today
        #             - [Integer] complaints the number of spam complaints with this tag so far today
        #             - [Integer] unsubs the number of unsubscribes with this tag so far today
        #             - [Integer] opens the number of times emails have been opened with this tag so far today
        #             - [Integer] unique_opens the number of unique opens for emails sent with this tag so far today
        #             - [Integer] clicks the number of URLs that have been clicked with this tag so far today
        #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag so far today
        #         - [Hash] last_7_days stats with this tag in the last 7 days
        #             - [Integer] sent the number of emails sent with this tag in the last 7 days
        #             - [Integer] hard_bounces the number of emails hard bounced with this tag in the last 7 days
        #             - [Integer] soft_bounces the number of emails soft bounced with this tag in the last 7 days
        #             - [Integer] rejects the number of emails rejected for sending this tag in the last 7 days
        #             - [Integer] complaints the number of spam complaints with this tag in the last 7 days
        #             - [Integer] unsubs the number of unsubscribes with this tag in the last 7 days
        #             - [Integer] opens the number of times emails have been opened with this tag in the last 7 days
        #             - [Integer] unique_opens the number of unique opens for emails sent with this tag in the last 7 days
        #             - [Integer] clicks the number of URLs that have been clicked with this tag in the last 7 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag in the last 7 days
        #         - [Hash] last_30_days stats with this tag in the last 30 days
        #             - [Integer] sent the number of emails sent with this tag in the last 30 days
        #             - [Integer] hard_bounces the number of emails hard bounced with this tag in the last 30 days
        #             - [Integer] soft_bounces the number of emails soft bounced with this tag in the last 30 days
        #             - [Integer] rejects the number of emails rejected for sending this tag in the last 30 days
        #             - [Integer] complaints the number of spam complaints with this tag in the last 30 days
        #             - [Integer] unsubs the number of unsubscribes with this tag in the last 30 days
        #             - [Integer] opens the number of times emails have been opened with this tag in the last 30 days
        #             - [Integer] unique_opens the number of unique opens for emails sent with this tag in the last 30 days
        #             - [Integer] clicks the number of URLs that have been clicked with this tag in the last 30 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag in the last 30 days
        #         - [Hash] last_60_days stats with this tag in the last 60 days
        #             - [Integer] sent the number of emails sent with this tag in the last 60 days
        #             - [Integer] hard_bounces the number of emails hard bounced with this tag in the last 60 days
        #             - [Integer] soft_bounces the number of emails soft bounced with this tag in the last 60 days
        #             - [Integer] rejects the number of emails rejected for sending this tag in the last 60 days
        #             - [Integer] complaints the number of spam complaints with this tag in the last 60 days
        #             - [Integer] unsubs the number of unsubscribes with this tag in the last 60 days
        #             - [Integer] opens the number of times emails have been opened with this tag in the last 60 days
        #             - [Integer] unique_opens the number of unique opens for emails sent with this tag in the last 60 days
        #             - [Integer] clicks the number of URLs that have been clicked with this tag in the last 60 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag in the last 60 days
        #         - [Hash] last_90_days stats with this tag in the last 90 days
        #             - [Integer] sent the number of emails sent with this tag in the last 90 days
        #             - [Integer] hard_bounces the number of emails hard bounced with this tag in the last 90 days
        #             - [Integer] soft_bounces the number of emails soft bounced with this tag in the last 90 days
        #             - [Integer] rejects the number of emails rejected for sending this tag in the last 90 days
        #             - [Integer] complaints the number of spam complaints with this tag in the last 90 days
        #             - [Integer] unsubs the number of unsubscribes with this tag in the last 90 days
        #             - [Integer] opens the number of times emails have been opened with this tag in the last 90 days
        #             - [Integer] unique_opens the number of unique opens for emails sent with this tag in the last 90 days
        #             - [Integer] clicks the number of URLs that have been clicked with this tag in the last 90 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag in the last 90 days
        def info(tag)
            _params = {:tag => tag}
            return @master.call 'tags/info', _params
        end

        # Return the recent history (hourly stats for the last 30 days) for a tag
        # @param [String] tag an existing tag name
        # @return [Array] the array of history information
        #     - [Hash] return[] the stats for a single hour
        #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the number of emails that were sent during the hour
        #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
        #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
        #         - [Integer] rejects the number of emails that were rejected during the hour
        #         - [Integer] complaints the number of spam complaints received during the hour
        #         - [Integer] unsubs the number of unsubscribes received during the hour
        #         - [Integer] opens the number of emails opened during the hour
        #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
        #         - [Integer] clicks the number of tracked URLs clicked during the hour
        #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
        def time_series(tag)
            _params = {:tag => tag}
            return @master.call 'tags/time-series', _params
        end

        # Return the recent history (hourly stats for the last 30 days) for all tags
        # @return [Array] the array of history information
        #     - [Hash] return[] the stats for a single hour
        #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the number of emails that were sent during the hour
        #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
        #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
        #         - [Integer] rejects the number of emails that were rejected during the hour
        #         - [Integer] complaints the number of spam complaints received during the hour
        #         - [Integer] unsubs the number of unsubscribes received during the hour
        #         - [Integer] opens the number of emails opened during the hour
        #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
        #         - [Integer] clicks the number of tracked URLs clicked during the hour
        #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
        def all_time_series()
            _params = {}
            return @master.call 'tags/all-time-series', _params
        end

    end
    class Messages
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Send a new transactional message through Mandrill
        # @param [Hash] message the information on the message to send
        #     - [String] html the full HTML content to be sent
        #     - [String] text optional full text content to be sent
        #     - [String] subject the message subject
        #     - [String] from_email the sender email address.
        #     - [String] from_name optional from name to be used
        #     - [Array] to an array of recipient information.
        #         - [Hash] to[] a single recipient's information.
        #             - [String] email the email address of the recipient
        #             - [String] name the optional display name to use for the recipient
        #             - [String] type the header type to use for the recipient, defaults to "to" if not provided
        #     - [Hash] headers optional extra headers to add to the message (most headers are allowed)
        #     - [Boolean] important whether or not this message is important, and should be delivered ahead of non-important messages
        #     - [Boolean] track_opens whether or not to turn on open tracking for the message
        #     - [Boolean] track_clicks whether or not to turn on click tracking for the message
        #     - [Boolean] auto_text whether or not to automatically generate a text part for messages that are not given text
        #     - [Boolean] auto_html whether or not to automatically generate an HTML part for messages that are not given HTML
        #     - [Boolean] inline_css whether or not to automatically inline all CSS styles provided in the message HTML - only for HTML documents less than 256KB in size
        #     - [Boolean] url_strip_qs whether or not to strip the query string from URLs when aggregating tracked URL data
        #     - [Boolean] preserve_recipients whether or not to expose all recipients in to "To" header for each email
        #     - [Boolean] view_content_link set to false to remove content logging for sensitive emails
        #     - [String] bcc_address an optional address to receive an exact copy of each recipient's email
        #     - [String] tracking_domain a custom domain to use for tracking opens and clicks instead of mandrillapp.com
        #     - [String] signing_domain a custom domain to use for SPF/DKIM signing instead of mandrill (for "via" or "on behalf of" in email clients)
        #     - [String] return_path_domain a custom domain to use for the messages's return-path
        #     - [Boolean] merge whether to evaluate merge tags in the message. Will automatically be set to true if either merge_vars or global_merge_vars are provided.
        #     - [String] merge_language the merge tag language to use when evaluating merge tags, either mailchimp or handlebars
        #     - [Array] global_merge_vars global merge variables to use for all recipients. You can override these per recipient.
        #         - [Hash] global_merge_vars[] a single global merge variable
        #             - [String] name the global merge variable's name. Merge variable names are case-insensitive and may not start with _
        #             - [Mixed] content the global merge variable's content
        #     - [Array] merge_vars per-recipient merge variables, which override global merge variables with the same name.
        #         - [Hash] merge_vars[] per-recipient merge variables
        #             - [String] rcpt the email address of the recipient that the merge variables should apply to
        #             - [Array] vars the recipient's merge variables
        #                 - [Hash] vars[] a single merge variable
        #                     - [String] name the merge variable's name. Merge variable names are case-insensitive and may not start with _
        #                     - [Mixed] content the merge variable's content
        #     - [Array] tags an array of string to tag the message with.  Stats are accumulated using tags, though we only store the first 100 we see, so this should not be unique or change frequently.  Tags should be 50 characters or less.  Any tags starting with an underscore are reserved for internal use and will cause errors.
        #         - [String] tags[] a single tag - must not start with an underscore
        #     - [String] subaccount the unique id of a subaccount for this message - must already exist or will fail with an error
        #     - [Array] google_analytics_domains an array of strings indicating for which any matching URLs will automatically have Google Analytics parameters appended to their query string automatically.
        #     - [Array, String] google_analytics_campaign optional string indicating the value to set for the utm_campaign tracking parameter. If this isn't provided the email's from address will be used instead.
        #     - [Array] metadata metadata an associative array of user metadata. Mandrill will store this metadata and make it available for retrieval. In addition, you can select up to 10 metadata fields to index and make searchable using the Mandrill search api.
        #     - [Array] recipient_metadata Per-recipient metadata that will override the global values specified in the metadata parameter.
        #         - [Hash] recipient_metadata[] metadata for a single recipient
        #             - [String] rcpt the email address of the recipient that the metadata is associated with
        #             - [Array] values an associated array containing the recipient's unique metadata. If a key exists in both the per-recipient metadata and the global metadata, the per-recipient metadata will be used.
        #     - [Array] attachments an array of supported attachments to add to the message
        #         - [Hash] attachments[] a single supported attachment
        #             - [String] type the MIME type of the attachment
        #             - [String] name the file name of the attachment
        #             - [String] content the content of the attachment as a base64-encoded string
        #     - [Array] images an array of embedded images to add to the message
        #         - [Hash] images[] a single embedded image
        #             - [String] type the MIME type of the image - must start with "image/"
        #             - [String] name the Content ID of the image - use <img src="cid:THIS_VALUE"> to reference the image in your HTML content
        #             - [String] content the content of the image as a base64-encoded string
        # @param [Boolean] async enable a background sending mode that is optimized for bulk sending. In async mode, messages/send will immediately return a status of "queued" for every recipient. To handle rejections when sending in async mode, set up a webhook for the 'reject' event. Defaults to false for messages with no more than 10 recipients; messages with more than 10 recipients are always sent asynchronously, regardless of the value of async.
        # @param [String] ip_pool the name of the dedicated ip pool that should be used to send the message. If you do not have any dedicated IPs, this parameter has no effect. If you specify a pool that does not exist, your default pool will be used instead.
        # @param [String] send_at when this message should be sent as a UTC timestamp in YYYY-MM-DD HH:MM:SS format. If you specify a time in the past, the message will be sent immediately. An additional fee applies for scheduled email, and this feature is only available to accounts with a positive balance.
        # @return [Array] of structs for each recipient containing the key "email" with the email address, and details of the message status for that recipient
        #     - [Hash] return[] the sending results for a single recipient
        #         - [String] email the email address of the recipient
        #         - [String] status the sending status of the recipient - either "sent", "queued", "scheduled", "rejected", or "invalid"
        #         - [String] reject_reason the reason for the rejection if the recipient status is "rejected" - one of "hard-bounce", "soft-bounce", "spam", "unsub", "custom", "invalid-sender", "invalid", "test-mode-limit", or "rule"
        #         - [String] _id the message's unique id
        def send(message, async=false, ip_pool=nil, send_at=nil)
            _params = {:message => message, :async => async, :ip_pool => ip_pool, :send_at => send_at}
            return @master.call 'messages/send', _params
        end

        # Send a new transactional message through Mandrill using a template
        # @param [String] template_name the immutable name or slug of a template that exists in the user's account. For backwards-compatibility, the template name may also be used but the immutable slug is preferred.
        # @param [Array] template_content an array of template content to send.  Each item in the array should be a struct with two keys - name: the name of the content block to set the content for, and content: the actual content to put into the block
        #     - [Hash] template_content[] the injection of a single piece of content into a single editable region
        #         - [String] name the name of the mc:edit editable region to inject into
        #         - [String] content the content to inject
        # @param [Hash] message the other information on the message to send - same as /messages/send, but without the html content
        #     - [String] html optional full HTML content to be sent if not in template
        #     - [String] text optional full text content to be sent
        #     - [String] subject the message subject
        #     - [String] from_email the sender email address.
        #     - [String] from_name optional from name to be used
        #     - [Array] to an array of recipient information.
        #         - [Hash] to[] a single recipient's information.
        #             - [String] email the email address of the recipient
        #             - [String] name the optional display name to use for the recipient
        #             - [String] type the header type to use for the recipient, defaults to "to" if not provided
        #     - [Hash] headers optional extra headers to add to the message (most headers are allowed)
        #     - [Boolean] important whether or not this message is important, and should be delivered ahead of non-important messages
        #     - [Boolean] track_opens whether or not to turn on open tracking for the message
        #     - [Boolean] track_clicks whether or not to turn on click tracking for the message
        #     - [Boolean] auto_text whether or not to automatically generate a text part for messages that are not given text
        #     - [Boolean] auto_html whether or not to automatically generate an HTML part for messages that are not given HTML
        #     - [Boolean] inline_css whether or not to automatically inline all CSS styles provided in the message HTML - only for HTML documents less than 256KB in size
        #     - [Boolean] url_strip_qs whether or not to strip the query string from URLs when aggregating tracked URL data
        #     - [Boolean] preserve_recipients whether or not to expose all recipients in to "To" header for each email
        #     - [Boolean] view_content_link set to false to remove content logging for sensitive emails
        #     - [String] bcc_address an optional address to receive an exact copy of each recipient's email
        #     - [String] tracking_domain a custom domain to use for tracking opens and clicks instead of mandrillapp.com
        #     - [String] signing_domain a custom domain to use for SPF/DKIM signing instead of mandrill (for "via" or "on behalf of" in email clients)
        #     - [String] return_path_domain a custom domain to use for the messages's return-path
        #     - [Boolean] merge whether to evaluate merge tags in the message. Will automatically be set to true if either merge_vars or global_merge_vars are provided.
        #     - [String] merge_language the merge tag language to use when evaluating merge tags, either mailchimp or handlebars
        #     - [Array] global_merge_vars global merge variables to use for all recipients. You can override these per recipient.
        #         - [Hash] global_merge_vars[] a single global merge variable
        #             - [String] name the global merge variable's name. Merge variable names are case-insensitive and may not start with _
        #             - [Mixed] content the global merge variable's content
        #     - [Array] merge_vars per-recipient merge variables, which override global merge variables with the same name.
        #         - [Hash] merge_vars[] per-recipient merge variables
        #             - [String] rcpt the email address of the recipient that the merge variables should apply to
        #             - [Array] vars the recipient's merge variables
        #                 - [Hash] vars[] a single merge variable
        #                     - [String] name the merge variable's name. Merge variable names are case-insensitive and may not start with _
        #                     - [Mixed] content the merge variable's content
        #     - [Array] tags an array of string to tag the message with.  Stats are accumulated using tags, though we only store the first 100 we see, so this should not be unique or change frequently.  Tags should be 50 characters or less.  Any tags starting with an underscore are reserved for internal use and will cause errors.
        #         - [String] tags[] a single tag - must not start with an underscore
        #     - [String] subaccount the unique id of a subaccount for this message - must already exist or will fail with an error
        #     - [Array] google_analytics_domains an array of strings indicating for which any matching URLs will automatically have Google Analytics parameters appended to their query string automatically.
        #     - [Array, String] google_analytics_campaign optional string indicating the value to set for the utm_campaign tracking parameter. If this isn't provided the email's from address will be used instead.
        #     - [Array] metadata metadata an associative array of user metadata. Mandrill will store this metadata and make it available for retrieval. In addition, you can select up to 10 metadata fields to index and make searchable using the Mandrill search api.
        #     - [Array] recipient_metadata Per-recipient metadata that will override the global values specified in the metadata parameter.
        #         - [Hash] recipient_metadata[] metadata for a single recipient
        #             - [String] rcpt the email address of the recipient that the metadata is associated with
        #             - [Array] values an associated array containing the recipient's unique metadata. If a key exists in both the per-recipient metadata and the global metadata, the per-recipient metadata will be used.
        #     - [Array] attachments an array of supported attachments to add to the message
        #         - [Hash] attachments[] a single supported attachment
        #             - [String] type the MIME type of the attachment
        #             - [String] name the file name of the attachment
        #             - [String] content the content of the attachment as a base64-encoded string
        #     - [Array] images an array of embedded images to add to the message
        #         - [Hash] images[] a single embedded image
        #             - [String] type the MIME type of the image - must start with "image/"
        #             - [String] name the Content ID of the image - use <img src="cid:THIS_VALUE"> to reference the image in your HTML content
        #             - [String] content the content of the image as a base64-encoded string
        # @param [Boolean] async enable a background sending mode that is optimized for bulk sending. In async mode, messages/send will immediately return a status of "queued" for every recipient. To handle rejections when sending in async mode, set up a webhook for the 'reject' event. Defaults to false for messages with no more than 10 recipients; messages with more than 10 recipients are always sent asynchronously, regardless of the value of async.
        # @param [String] ip_pool the name of the dedicated ip pool that should be used to send the message. If you do not have any dedicated IPs, this parameter has no effect. If you specify a pool that does not exist, your default pool will be used instead.
        # @param [String] send_at when this message should be sent as a UTC timestamp in YYYY-MM-DD HH:MM:SS format. If you specify a time in the past, the message will be sent immediately. An additional fee applies for scheduled email, and this feature is only available to accounts with a positive balance.
        # @return [Array] of structs for each recipient containing the key "email" with the email address, and details of the message status for that recipient
        #     - [Hash] return[] the sending results for a single recipient
        #         - [String] email the email address of the recipient
        #         - [String] status the sending status of the recipient - either "sent", "queued", "rejected", or "invalid"
        #         - [String] reject_reason the reason for the rejection if the recipient status is "rejected" - one of "hard-bounce", "soft-bounce", "spam", "unsub", "custom", "invalid-sender", "invalid", "test-mode-limit", or "rule"
        #         - [String] _id the message's unique id
        def send_template(template_name, template_content, message, async=false, ip_pool=nil, send_at=nil)
            _params = {:template_name => template_name, :template_content => template_content, :message => message, :async => async, :ip_pool => ip_pool, :send_at => send_at}
            return @master.call 'messages/send-template', _params
        end

        # Search recently sent messages and optionally narrow by date range, tags, senders, and API keys. If no date range is specified, results within the last 7 days are returned. This method may be called up to 20 times per minute. If you need the data more often, you can use <a href="/api/docs/messages.html#method=info">/messages/info.json</a> to get the information for a single message, or <a href="http://help.mandrill.com/entries/21738186-Introduction-to-Webhooks">webhooks</a> to push activity to your own application for querying.
        # @param [String] query <a href="http://help.mandrill.com/entries/22211902">search terms</a> to find matching messages
        # @param [String] date_from start date
        # @param [String] date_to end date
        # @param [Array] tags an array of tag names to narrow the search to, will return messages that contain ANY of the tags
        # @param [Array] senders an array of sender addresses to narrow the search to, will return messages sent by ANY of the senders
        # @param [Array] api_keys an array of API keys to narrow the search to, will return messages sent by ANY of the keys
        # @param [Integer] limit the maximum number of results to return, defaults to 100, 1000 is the maximum
        # @return [Array] of structs for each matching message
        #     - [Hash] return[] the information for a single matching message
        #         - [Integer] ts the Unix timestamp from when this message was sent
        #         - [String] _id the message's unique id
        #         - [String] sender the email address of the sender
        #         - [String] template the unique name of the template used, if any
        #         - [String] subject the message's subject line
        #         - [String] email the recipient email address
        #         - [Array] tags list of tags on this message
        #             - [String] tags[] individual tag on this message
        #         - [Integer] opens how many times has this message been opened
        #         - [Array] opens_detail list of individual opens for the message
        #             - [Hash] opens_detail[] information on an individual open
        #                 - [Integer] ts the unix timestamp from when the message was opened
        #                 - [String] ip the IP address that generated the open
        #                 - [String] location the approximate region and country that the opening IP is located
        #                 - [String] ua the email client or browser data of the open
        #         - [Integer] clicks how many times has a link been clicked in this message
        #         - [Array] clicks_detail list of individual clicks for the message
        #             - [Hash] clicks_detail[] information on an individual click
        #                 - [Integer] ts the unix timestamp from when the message was clicked
        #                 - [String] url the URL that was clicked on
        #                 - [String] ip the IP address that generated the click
        #                 - [String] location the approximate region and country that the clicking IP is located
        #                 - [String] ua the email client or browser data of the click
        #         - [String] state sending status of this message: sent, bounced, rejected
        #         - [Hash] metadata any custom metadata provided when the message was sent
        #     - [Array] smtp_events a log of up to 3 smtp events for the message
        #         - [Hash] smtp_events[] information about a specific smtp event
        #             - [Integer] ts the Unix timestamp when the event occured
        #             - [String] type the message's state as a result of this event
        #             - [String] diag the SMTP response from the recipient's server
        def search(query='*', date_from=nil, date_to=nil, tags=nil, senders=nil, api_keys=nil, limit=100)
            _params = {:query => query, :date_from => date_from, :date_to => date_to, :tags => tags, :senders => senders, :api_keys => api_keys, :limit => limit}
            return @master.call 'messages/search', _params
        end

        # Search the content of recently sent messages and return the aggregated hourly stats for matching messages
        # @param [String] query the search terms to find matching messages for
        # @param [String] date_from start date
        # @param [String] date_to end date
        # @param [Array] tags an array of tag names to narrow the search to, will return messages that contain ANY of the tags
        # @param [Array] senders an array of sender addresses to narrow the search to, will return messages sent by ANY of the senders
        # @return [Array] the array of history information
        #     - [Hash] return[] the stats for a single hour
        #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the number of emails that were sent during the hour
        #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
        #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
        #         - [Integer] rejects the number of emails that were rejected during the hour
        #         - [Integer] complaints the number of spam complaints received during the hour
        #         - [Integer] unsubs the number of unsubscribes received during the hour
        #         - [Integer] opens the number of emails opened during the hour
        #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
        #         - [Integer] clicks the number of tracked URLs clicked during the hour
        #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
        def search_time_series(query='*', date_from=nil, date_to=nil, tags=nil, senders=nil)
            _params = {:query => query, :date_from => date_from, :date_to => date_to, :tags => tags, :senders => senders}
            return @master.call 'messages/search-time-series', _params
        end

        # Get the information for a single recently sent message
        # @param [String] id the unique id of the message to get - passed as the "_id" field in webhooks, send calls, or search calls
        # @return [Hash] the information for the message
        #     - [Integer] ts the Unix timestamp from when this message was sent
        #     - [String] _id the message's unique id
        #     - [String] sender the email address of the sender
        #     - [String] template the unique name of the template used, if any
        #     - [String] subject the message's subject line
        #     - [String] email the recipient email address
        #     - [Array] tags list of tags on this message
        #         - [String] tags[] individual tag on this message
        #     - [Integer] opens how many times has this message been opened
        #     - [Array] opens_detail list of individual opens for the message
        #         - [Hash] opens_detail[] information on an individual open
        #             - [Integer] ts the unix timestamp from when the message was opened
        #             - [String] ip the IP address that generated the open
        #             - [String] location the approximate region and country that the opening IP is located
        #             - [String] ua the email client or browser data of the open
        #     - [Integer] clicks how many times has a link been clicked in this message
        #     - [Array] clicks_detail list of individual clicks for the message
        #         - [Hash] clicks_detail[] information on an individual click
        #             - [Integer] ts the unix timestamp from when the message was clicked
        #             - [String] url the URL that was clicked on
        #             - [String] ip the IP address that generated the click
        #             - [String] location the approximate region and country that the clicking IP is located
        #             - [String] ua the email client or browser data of the click
        #     - [String] state sending status of this message: sent, bounced, rejected
        #     - [Hash] metadata any custom metadata provided when the message was sent
        #     - [Array] smtp_events a log of up to 3 smtp events for the message
        #         - [Hash] smtp_events[] information about a specific smtp event
        #             - [Integer] ts the Unix timestamp when the event occured
        #             - [String] type the message's state as a result of this event
        #             - [String] diag the SMTP response from the recipient's server
        def info(id)
            _params = {:id => id}
            return @master.call 'messages/info', _params
        end

        # Get the full content of a recently sent message
        # @param [String] id the unique id of the message to get - passed as the "_id" field in webhooks, send calls, or search calls
        # @return [Hash] the content of the message
        #     - [Integer] ts the Unix timestamp from when this message was sent
        #     - [String] _id the message's unique id
        #     - [String] from_email the email address of the sender
        #     - [String] from_name the alias of the sender (if any)
        #     - [String] subject the message's subject line
        #     - [Hash] to the message recipient's information
        #         - [String] email the email address of the recipient
        #         - [String] name the alias of the recipient (if any)
        #     - [Array] tags list of tags on this message
        #         - [String] tags[] individual tag on this message
        #     - [Hash] headers the key-value pairs of the custom MIME headers for the message's main document
        #     - [String] text the text part of the message, if any
        #     - [String] html the HTML part of the message, if any
        #     - [Array] attachments an array of any attachments that can be found in the message
        #         - [Hash] attachments[] information about an individual attachment
        #             - [String] name the file name of the attachment
        #             - [String] type the MIME type of the attachment
        #             - [String] content the content of the attachment as a base64 encoded string
        def content(id)
            _params = {:id => id}
            return @master.call 'messages/content', _params
        end

        # Parse the full MIME document for an email message, returning the content of the message broken into its constituent pieces
        # @param [String] raw_message the full MIME document of an email message
        # @return [Hash] the parsed message
        #     - [String] subject the subject of the message
        #     - [String] from_email the email address of the sender
        #     - [String] from_name the alias of the sender (if any)
        #     - [Array] to an array of any recipients in the message
        #         - [Hash] to[] the information on a single recipient
        #             - [String] email the email address of the recipient
        #             - [String] name the alias of the recipient (if any)
        #     - [Hash] headers the key-value pairs of the MIME headers for the message's main document
        #     - [String] text the text part of the message, if any
        #     - [String] html the HTML part of the message, if any
        #     - [Array] attachments an array of any attachments that can be found in the message
        #         - [Hash] attachments[] information about an individual attachment
        #             - [String] name the file name of the attachment
        #             - [String] type the MIME type of the attachment
        #             - [Boolean] binary if this is set to true, the attachment is not pure-text, and the content will be base64 encoded
        #             - [String] content the content of the attachment as a text string or a base64 encoded string based on the attachment type
        #     - [Array] images an array of any embedded images that can be found in the message
        #         - [Hash] images[] information about an individual image
        #             - [String] name the Content-ID of the embedded image
        #             - [String] type the MIME type of the image
        #             - [String] content the content of the image as a base64 encoded string
        def parse(raw_message)
            _params = {:raw_message => raw_message}
            return @master.call 'messages/parse', _params
        end

        # Take a raw MIME document for a message, and send it exactly as if it were sent through Mandrill's SMTP servers
        # @param [String] raw_message the full MIME document of an email message
        # @param [String, nil] from_email optionally define the sender address - otherwise we'll use the address found in the provided headers
        # @param [String, nil] from_name optionally define the sender alias
        # @param [Array, nil] to optionally define the recipients to receive the message - otherwise we'll use the To, Cc, and Bcc headers provided in the document
        #     - [String] to[] the email address of the recipient
        # @param [Boolean] async enable a background sending mode that is optimized for bulk sending. In async mode, messages/sendRaw will immediately return a status of "queued" for every recipient. To handle rejections when sending in async mode, set up a webhook for the 'reject' event. Defaults to false for messages with no more than 10 recipients; messages with more than 10 recipients are always sent asynchronously, regardless of the value of async.
        # @param [String] ip_pool the name of the dedicated ip pool that should be used to send the message. If you do not have any dedicated IPs, this parameter has no effect. If you specify a pool that does not exist, your default pool will be used instead.
        # @param [String] send_at when this message should be sent as a UTC timestamp in YYYY-MM-DD HH:MM:SS format. If you specify a time in the past, the message will be sent immediately.
        # @param [String] return_path_domain a custom domain to use for the messages's return-path
        # @return [Array] of structs for each recipient containing the key "email" with the email address, and details of the message status for that recipient
        #     - [Hash] return[] the sending results for a single recipient
        #         - [String] email the email address of the recipient
        #         - [String] status the sending status of the recipient - either "sent", "queued", "scheduled", "rejected", or "invalid"
        #         - [String] reject_reason the reason for the rejection if the recipient status is "rejected" - one of "hard-bounce", "soft-bounce", "spam", "unsub", "custom", "invalid-sender", "invalid", "test-mode-limit", or "rule"
        #         - [String] _id the message's unique id
        def send_raw(raw_message, from_email=nil, from_name=nil, to=nil, async=false, ip_pool=nil, send_at=nil, return_path_domain=nil)
            _params = {:raw_message => raw_message, :from_email => from_email, :from_name => from_name, :to => to, :async => async, :ip_pool => ip_pool, :send_at => send_at, :return_path_domain => return_path_domain}
            return @master.call 'messages/send-raw', _params
        end

        # Queries your scheduled emails.
        # @param [String] to an optional recipient address to restrict results to
        # @return [Array] a list of up to 1000 scheduled emails
        #     - [Hash] return[] a scheduled email
        #         - [String] _id the scheduled message id
        #         - [String] created_at the UTC timestamp when the message was created, in YYYY-MM-DD HH:MM:SS format
        #         - [String] send_at the UTC timestamp when the message will be sent, in YYYY-MM-DD HH:MM:SS format
        #         - [String] from_email the email's sender address
        #         - [String] to the email's recipient
        #         - [String] subject the email's subject
        def list_scheduled(to=nil)
            _params = {:to => to}
            return @master.call 'messages/list-scheduled', _params
        end

        # Cancels a scheduled email.
        # @param [String] id a scheduled email id, as returned by any of the messages/send calls or messages/list-scheduled
        # @return [Hash] information about the scheduled email that was cancelled.
        #     - [String] _id the scheduled message id
        #     - [String] created_at the UTC timestamp when the message was created, in YYYY-MM-DD HH:MM:SS format
        #     - [String] send_at the UTC timestamp when the message will be sent, in YYYY-MM-DD HH:MM:SS format
        #     - [String] from_email the email's sender address
        #     - [String] to the email's recipient
        #     - [String] subject the email's subject
        def cancel_scheduled(id)
            _params = {:id => id}
            return @master.call 'messages/cancel-scheduled', _params
        end

        # Reschedules a scheduled email.
        # @param [String] id a scheduled email id, as returned by any of the messages/send calls or messages/list-scheduled
        # @param [String] send_at the new UTC timestamp when the message should sent. Mandrill can't time travel, so if you specify a time in past the message will be sent immediately
        # @return [Hash] information about the scheduled email that was rescheduled.
        #     - [String] _id the scheduled message id
        #     - [String] created_at the UTC timestamp when the message was created, in YYYY-MM-DD HH:MM:SS format
        #     - [String] send_at the UTC timestamp when the message will be sent, in YYYY-MM-DD HH:MM:SS format
        #     - [String] from_email the email's sender address
        #     - [String] to the email's recipient
        #     - [String] subject the email's subject
        def reschedule(id, send_at)
            _params = {:id => id, :send_at => send_at}
            return @master.call 'messages/reschedule', _params
        end

    end
    class Whitelists
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Adds an email to your email rejection whitelist. If the address is currently on your blacklist, that blacklist entry will be removed automatically.
        # @param [String] email an email address to add to the whitelist
        # @param [String] comment an optional description of why the email was whitelisted
        # @return [Hash] a status object containing the address and the result of the operation
        #     - [String] email the email address you provided
        #     - [Boolean] added whether the operation succeeded
        def add(email, comment=nil)
            _params = {:email => email, :comment => comment}
            return @master.call 'whitelists/add', _params
        end

        # Retrieves your email rejection whitelist. You can provide an email address or search prefix to limit the results. Returns up to 1000 results.
        # @param [String] email an optional email address or prefix to search by
        # @return [Array] up to 1000 whitelist entries
        #     - [Hash] return[] the information for each whitelist entry
        #         - [String] email the email that is whitelisted
        #         - [String] detail a description of why the email was whitelisted
        #         - [String] created_at when the email was added to the whitelist
        def list(email=nil)
            _params = {:email => email}
            return @master.call 'whitelists/list', _params
        end

        # Removes an email address from the whitelist.
        # @param [String] email the email address to remove from the whitelist
        # @return [Hash] a status object containing the address and whether the deletion succeeded
        #     - [String] email the email address that was removed from the blacklist
        #     - [Boolean] deleted whether the address was deleted successfully
        def delete(email)
            _params = {:email => email}
            return @master.call 'whitelists/delete', _params
        end

    end
    class Ips
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Lists your dedicated IPs.
        # @return [Array] an array of structs for each dedicated IP
        #     - [Hash] return[] information about a single dedicated IP
        #         - [String] ip the ip address
        #         - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] pool the name of the pool that this dedicated IP belongs to
        #         - [String] domain the domain name (reverse dns) of this dedicated IP
        #         - [Hash] custom_dns information about the ip's custom dns, if it has been configured
        #             - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
        #             - [Boolean] valid whether the ip's custom dns is currently valid
        #             - [String] error if the ip's custom dns is invalid, this will include details about the error
        #         - [Hash] warmup information about the ip's warmup status
        #             - [Boolean] warming_up whether the ip is currently in warmup mode
        #             - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        #             - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        def list()
            _params = {}
            return @master.call 'ips/list', _params
        end

        # Retrieves information about a single dedicated ip.
        # @param [String] ip a dedicated IP address
        # @return [Hash] Information about the dedicated ip
        #     - [String] ip the ip address
        #     - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] pool the name of the pool that this dedicated IP belongs to
        #     - [String] domain the domain name (reverse dns) of this dedicated IP
        #     - [Hash] custom_dns information about the ip's custom dns, if it has been configured
        #         - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
        #         - [Boolean] valid whether the ip's custom dns is currently valid
        #         - [String] error if the ip's custom dns is invalid, this will include details about the error
        #     - [Hash] warmup information about the ip's warmup status
        #         - [Boolean] warming_up whether the ip is currently in warmup mode
        #         - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        def info(ip)
            _params = {:ip => ip}
            return @master.call 'ips/info', _params
        end

        # Requests an additional dedicated IP for your account. Accounts may have one outstanding request at any time, and provisioning requests are processed within 24 hours.
        # @param [Boolean] warmup whether to enable warmup mode for the ip
        # @param [String] pool the id of the pool to add the dedicated ip to, or null to use your account's default pool
        # @return [Hash] a description of the provisioning request that was created
        #     - [String] requested_at the date and time that the request was created as a UTC timestamp in YYYY-MM-DD HH:MM:SS format
        def provision(warmup=false, pool=nil)
            _params = {:warmup => warmup, :pool => pool}
            return @master.call 'ips/provision', _params
        end

        # Begins the warmup process for a dedicated IP. During the warmup process, Mandrill will gradually increase the percentage of your mail that is sent over the warming-up IP, over a period of roughly 30 days. The rest of your mail will be sent over shared IPs or other dedicated IPs in the same pool.
        # @param [String] ip a dedicated ip address
        # @return [Hash] Information about the dedicated IP
        #     - [String] ip the ip address
        #     - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] pool the name of the pool that this dedicated IP belongs to
        #     - [String] domain the domain name (reverse dns) of this dedicated IP
        #     - [Hash] custom_dns information about the ip's custom dns, if it has been configured
        #         - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
        #         - [Boolean] valid whether the ip's custom dns is currently valid
        #         - [String] error if the ip's custom dns is invalid, this will include details about the error
        #     - [Hash] warmup information about the ip's warmup status
        #         - [Boolean] warming_up whether the ip is currently in warmup mode
        #         - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        def start_warmup(ip)
            _params = {:ip => ip}
            return @master.call 'ips/start-warmup', _params
        end

        # Cancels the warmup process for a dedicated IP.
        # @param [String] ip a dedicated ip address
        # @return [Hash] Information about the dedicated IP
        #     - [String] ip the ip address
        #     - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] pool the name of the pool that this dedicated IP belongs to
        #     - [String] domain the domain name (reverse dns) of this dedicated IP
        #     - [Hash] custom_dns information about the ip's custom dns, if it has been configured
        #         - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
        #         - [Boolean] valid whether the ip's custom dns is currently valid
        #         - [String] error if the ip's custom dns is invalid, this will include details about the error
        #     - [Hash] warmup information about the ip's warmup status
        #         - [Boolean] warming_up whether the ip is currently in warmup mode
        #         - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        def cancel_warmup(ip)
            _params = {:ip => ip}
            return @master.call 'ips/cancel-warmup', _params
        end

        # Moves a dedicated IP to a different pool.
        # @param [String] ip a dedicated ip address
        # @param [String] pool the name of the new pool to add the dedicated ip to
        # @param [Boolean] create_pool whether to create the pool if it does not exist; if false and the pool does not exist, an Unknown_Pool will be thrown.
        # @return [Hash] Information about the updated state of the dedicated IP
        #     - [String] ip the ip address
        #     - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] pool the name of the pool that this dedicated IP belongs to
        #     - [String] domain the domain name (reverse dns) of this dedicated IP
        #     - [Hash] custom_dns information about the ip's custom dns, if it has been configured
        #         - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
        #         - [Boolean] valid whether the ip's custom dns is currently valid
        #         - [String] error if the ip's custom dns is invalid, this will include details about the error
        #     - [Hash] warmup information about the ip's warmup status
        #         - [Boolean] warming_up whether the ip is currently in warmup mode
        #         - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        def set_pool(ip, pool, create_pool=false)
            _params = {:ip => ip, :pool => pool, :create_pool => create_pool}
            return @master.call 'ips/set-pool', _params
        end

        # Deletes a dedicated IP. This is permanent and cannot be undone.
        # @param [String] ip the dedicated ip to remove from your account
        # @return [Hash] a description of the ip that was removed from your account.
        #     - [String] ip the ip address
        #     - [String] deleted a boolean indicating whether the ip was successfully deleted
        def delete(ip)
            _params = {:ip => ip}
            return @master.call 'ips/delete', _params
        end

        # Lists your dedicated IP pools.
        # @return [Array] the dedicated IP pools for your account, up to a maximum of 1,000
        #     - [Hash] return[] information about each dedicated IP pool
        #         - [String] name this pool's name
        #         - [String] created_at the date and time that this pool was created as a UTC timestamp in YYYY-MM-DD HH:MM:SS format
        #         - [Array] ips the dedicated IPs in this pool
        #             - [Hash] ips[] information about each dedicated IP
        #                 - [String] ip the ip address
        #                 - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #                 - [String] pool the name of the pool that this dedicated IP belongs to
        #                 - [String] domain the domain name (reverse dns) of this dedicated IP
        #                 - [Hash] custom_dns information about the ip's custom dns, if it has been configured
        #                     - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
        #                     - [Boolean] valid whether the ip's custom dns is currently valid
        #                     - [String] error if the ip's custom dns is invalid, this will include details about the error
        #                 - [Hash] warmup information about the ip's warmup status
        #                     - [Boolean] warming_up whether the ip is currently in warmup mode
        #                     - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        #                     - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        def list_pools()
            _params = {}
            return @master.call 'ips/list-pools', _params
        end

        # Describes a single dedicated IP pool.
        # @param [String] pool a pool name
        # @return [Hash] Information about the dedicated ip pool
        #     - [String] name this pool's name
        #     - [String] created_at the date and time that this pool was created as a UTC timestamp in YYYY-MM-DD HH:MM:SS format
        #     - [Array] ips the dedicated IPs in this pool
        #         - [Hash] ips[] information about each dedicated IP
        #             - [String] ip the ip address
        #             - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #             - [String] pool the name of the pool that this dedicated IP belongs to
        #             - [String] domain the domain name (reverse dns) of this dedicated IP
        #             - [Hash] custom_dns information about the ip's custom dns, if it has been configured
        #                 - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
        #                 - [Boolean] valid whether the ip's custom dns is currently valid
        #                 - [String] error if the ip's custom dns is invalid, this will include details about the error
        #             - [Hash] warmup information about the ip's warmup status
        #                 - [Boolean] warming_up whether the ip is currently in warmup mode
        #                 - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        #                 - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        def pool_info(pool)
            _params = {:pool => pool}
            return @master.call 'ips/pool-info', _params
        end

        # Creates a pool and returns it. If a pool already exists with this name, no action will be performed.
        # @param [String] pool the name of a pool to create
        # @return [Hash] Information about the dedicated ip pool
        #     - [String] name this pool's name
        #     - [String] created_at the date and time that this pool was created as a UTC timestamp in YYYY-MM-DD HH:MM:SS format
        #     - [Array] ips the dedicated IPs in this pool
        #         - [Hash] ips[] information about each dedicated IP
        #             - [String] ip the ip address
        #             - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #             - [String] pool the name of the pool that this dedicated IP belongs to
        #             - [String] domain the domain name (reverse dns) of this dedicated IP
        #             - [Hash] custom_dns information about the ip's custom dns, if it has been configured
        #                 - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
        #                 - [Boolean] valid whether the ip's custom dns is currently valid
        #                 - [String] error if the ip's custom dns is invalid, this will include details about the error
        #             - [Hash] warmup information about the ip's warmup status
        #                 - [Boolean] warming_up whether the ip is currently in warmup mode
        #                 - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        #                 - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        def create_pool(pool)
            _params = {:pool => pool}
            return @master.call 'ips/create-pool', _params
        end

        # Deletes a pool. A pool must be empty before you can delete it, and you cannot delete your default pool.
        # @param [String] pool the name of the pool to delete
        # @return [Hash] information about the status of the pool that was deleted
        #     - [String] pool the name of the pool
        #     - [Boolean] deleted whether the pool was deleted
        def delete_pool(pool)
            _params = {:pool => pool}
            return @master.call 'ips/delete-pool', _params
        end

        # Tests whether a domain name is valid for use as the custom reverse DNS for a dedicated IP.
        # @param [String] ip a dedicated ip address
        # @param [String] domain the domain name to test
        # @return [Hash] validation results for the domain
        #     - [String] valid whether the domain name has a correctly-configured A record pointing to the ip address
        #     - [String] error if valid is false, this will contain details about why the domain's A record is incorrect
        def check_custom_dns(ip, domain)
            _params = {:ip => ip, :domain => domain}
            return @master.call 'ips/check-custom-dns', _params
        end

        # Configures the custom DNS name for a dedicated IP.
        # @param [String] ip a dedicated ip address
        # @param [String] domain a domain name to set as the dedicated IP's custom dns name.
        # @return [Hash] information about the dedicated IP's new configuration
        #     - [String] ip the ip address
        #     - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] pool the name of the pool that this dedicated IP belongs to
        #     - [String] domain the domain name (reverse dns) of this dedicated IP
        #     - [Hash] custom_dns information about the ip's custom dns, if it has been configured
        #         - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
        #         - [Boolean] valid whether the ip's custom dns is currently valid
        #         - [String] error if the ip's custom dns is invalid, this will include details about the error
        #     - [Hash] warmup information about the ip's warmup status
        #         - [Boolean] warming_up whether the ip is currently in warmup mode
        #         - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
        def set_custom_dns(ip, domain)
            _params = {:ip => ip, :domain => domain}
            return @master.call 'ips/set-custom-dns', _params
        end

    end
    class Internal
        attr_accessor :master

        def initialize(master)
            @master = master
        end

    end
    class Subaccounts
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Get the list of subaccounts defined for the account, optionally filtered by a prefix
        # @param [String] q an optional prefix to filter the subaccounts' ids and names
        # @return [Array] the subaccounts for the account, up to a maximum of 1,000
        #     - [Hash] return[] the individual subaccount info
        #         - [String] id a unique indentifier for the subaccount
        #         - [String] name an optional display name for the subaccount
        #         - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
        #         - [String] status the current sending status of the subaccount, one of "active" or "paused"
        #         - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
        #         - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
        #         - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
        #         - [Integer] sent_total the number of emails the subaccount has sent since it was created
        def list(q=nil)
            _params = {:q => q}
            return @master.call 'subaccounts/list', _params
        end

        # Add a new subaccount
        # @param [String] id a unique identifier for the subaccount to be used in sending calls
        # @param [String] name an optional display name to further identify the subaccount
        # @param [String] notes optional extra text to associate with the subaccount
        # @param [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, Mandrill will manage this based on reputation
        # @return [Hash] the information saved about the new subaccount
        #     - [String] id a unique indentifier for the subaccount
        #     - [String] name an optional display name for the subaccount
        #     - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
        #     - [String] status the current sending status of the subaccount, one of "active" or "paused"
        #     - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
        #     - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
        #     - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
        #     - [Integer] sent_total the number of emails the subaccount has sent since it was created
        def add(id, name=nil, notes=nil, custom_quota=nil)
            _params = {:id => id, :name => name, :notes => notes, :custom_quota => custom_quota}
            return @master.call 'subaccounts/add', _params
        end

        # Given the ID of an existing subaccount, return the data about it
        # @param [String] id the unique identifier of the subaccount to query
        # @return [Hash] the information about the subaccount
        #     - [String] id a unique indentifier for the subaccount
        #     - [String] name an optional display name for the subaccount
        #     - [String] notes optional extra text to associate with the subaccount
        #     - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
        #     - [String] status the current sending status of the subaccount, one of "active" or "paused"
        #     - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
        #     - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
        #     - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
        #     - [Integer] sent_total the number of emails the subaccount has sent since it was created
        #     - [Integer] sent_hourly the number of emails the subaccount has sent in the last hour
        #     - [Integer] hourly_quota the current hourly quota for the subaccount, either manual or reputation-based
        #     - [Hash] last_30_days stats for this subaccount in the last 30 days
        #         - [Integer] sent the number of emails sent for this subaccount in the last 30 days
        #         - [Integer] hard_bounces the number of emails hard bounced for this subaccount in the last 30 days
        #         - [Integer] soft_bounces the number of emails soft bounced for this subaccount in the last 30 days
        #         - [Integer] rejects the number of emails rejected for sending this subaccount in the last 30 days
        #         - [Integer] complaints the number of spam complaints for this subaccount in the last 30 days
        #         - [Integer] unsubs the number of unsbuscribes for this subaccount in the last 30 days
        #         - [Integer] opens the number of times emails have been opened for this subaccount in the last 30 days
        #         - [Integer] unique_opens the number of unique opens for emails sent for this subaccount in the last 30 days
        #         - [Integer] clicks the number of URLs that have been clicked for this subaccount in the last 30 days
        #         - [Integer] unique_clicks the number of unique clicks for emails sent for this subaccount in the last 30 days
        def info(id)
            _params = {:id => id}
            return @master.call 'subaccounts/info', _params
        end

        # Update an existing subaccount
        # @param [String] id the unique identifier of the subaccount to update
        # @param [String] name an optional display name to further identify the subaccount
        # @param [String] notes optional extra text to associate with the subaccount
        # @param [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, Mandrill will manage this based on reputation
        # @return [Hash] the information for the updated subaccount
        #     - [String] id a unique indentifier for the subaccount
        #     - [String] name an optional display name for the subaccount
        #     - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
        #     - [String] status the current sending status of the subaccount, one of "active" or "paused"
        #     - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
        #     - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
        #     - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
        #     - [Integer] sent_total the number of emails the subaccount has sent since it was created
        def update(id, name=nil, notes=nil, custom_quota=nil)
            _params = {:id => id, :name => name, :notes => notes, :custom_quota => custom_quota}
            return @master.call 'subaccounts/update', _params
        end

        # Delete an existing subaccount. Any email related to the subaccount will be saved, but stats will be removed and any future sending calls to this subaccount will fail.
        # @param [String] id the unique identifier of the subaccount to delete
        # @return [Hash] the information for the deleted subaccount
        #     - [String] id a unique indentifier for the subaccount
        #     - [String] name an optional display name for the subaccount
        #     - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
        #     - [String] status the current sending status of the subaccount, one of "active" or "paused"
        #     - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
        #     - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
        #     - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
        #     - [Integer] sent_total the number of emails the subaccount has sent since it was created
        def delete(id)
            _params = {:id => id}
            return @master.call 'subaccounts/delete', _params
        end

        # Pause a subaccount's sending. Any future emails delivered to this subaccount will be queued for a maximum of 3 days until the subaccount is resumed.
        # @param [String] id the unique identifier of the subaccount to pause
        # @return [Hash] the information for the paused subaccount
        #     - [String] id a unique indentifier for the subaccount
        #     - [String] name an optional display name for the subaccount
        #     - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
        #     - [String] status the current sending status of the subaccount, one of "active" or "paused"
        #     - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
        #     - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
        #     - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
        #     - [Integer] sent_total the number of emails the subaccount has sent since it was created
        def pause(id)
            _params = {:id => id}
            return @master.call 'subaccounts/pause', _params
        end

        # Resume a paused subaccount's sending
        # @param [String] id the unique identifier of the subaccount to resume
        # @return [Hash] the information for the resumed subaccount
        #     - [String] id a unique indentifier for the subaccount
        #     - [String] name an optional display name for the subaccount
        #     - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
        #     - [String] status the current sending status of the subaccount, one of "active" or "paused"
        #     - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
        #     - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
        #     - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
        #     - [Integer] sent_total the number of emails the subaccount has sent since it was created
        def resume(id)
            _params = {:id => id}
            return @master.call 'subaccounts/resume', _params
        end

    end
    class Urls
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Get the 100 most clicked URLs
        # @return [Array] the 100 most clicked URLs and their stats
        #     - [Hash] return[] the individual URL stats
        #         - [String] url the URL to be tracked
        #         - [Integer] sent the number of emails that contained the URL
        #         - [Integer] clicks the number of times the URL has been clicked from a tracked email
        #         - [Integer] unique_clicks the number of unique emails that have generated clicks for this URL
        def list()
            _params = {}
            return @master.call 'urls/list', _params
        end

        # Return the 100 most clicked URLs that match the search query given
        # @param [String] q a search query
        # @return [Array] the 100 most clicked URLs matching the search query
        #     - [Hash] return[] the URL matching the query
        #         - [String] url the URL to be tracked
        #         - [Integer] sent the number of emails that contained the URL
        #         - [Integer] clicks the number of times the URL has been clicked from a tracked email
        #         - [Integer] unique_clicks the number of unique emails that have generated clicks for this URL
        def search(q)
            _params = {:q => q}
            return @master.call 'urls/search', _params
        end

        # Return the recent history (hourly stats for the last 30 days) for a url
        # @param [String] url an existing URL
        # @return [Array] the array of history information
        #     - [Hash] return[] the information for a single hour
        #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the number of emails that were sent with the URL during the hour
        #         - [Integer] clicks the number of times the URL was clicked during the hour
        #         - [Integer] unique_clicks the number of unique clicks generated for emails sent with this URL during the hour
        def time_series(url)
            _params = {:url => url}
            return @master.call 'urls/time-series', _params
        end

        # Get the list of tracking domains set up for this account
        # @return [Array] the tracking domains and their status
        #     - [Hash] return[] the individual tracking domain
        #         - [String] domain the tracking domain name
        #         - [String] created_at the date and time that the tracking domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] last_tested_at when the domain's DNS settings were last tested as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [Hash] cname details about the domain's CNAME record
        #             - [Boolean] valid whether the domain's CNAME record is valid for use with Mandrill
        #             - [String] valid_after when the domain's CNAME record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
        #             - [String] error an error describing the CNAME record, or null if the record is correct
        #         - [Boolean] valid_tracking whether this domain can be used as a tracking domain for email.
        def tracking_domains()
            _params = {}
            return @master.call 'urls/tracking-domains', _params
        end

        # Add a tracking domain to your account
        # @param [String] domain a domain name
        # @return [Hash] information about the domain
        #     - [String] domain the tracking domain name
        #     - [String] created_at the date and time that the tracking domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] last_tested_at when the domain's DNS settings were last tested as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Hash] cname details about the domain's CNAME record
        #         - [Boolean] valid whether the domain's CNAME record is valid for use with Mandrill
        #         - [String] valid_after when the domain's CNAME record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
        #         - [String] error an error describing the CNAME record, or null if the record is correct
        #     - [Boolean] valid_tracking whether this domain can be used as a tracking domain for email.
        def add_tracking_domain(domain)
            _params = {:domain => domain}
            return @master.call 'urls/add-tracking-domain', _params
        end

        # Checks the CNAME settings for a tracking domain. The domain must have been added already with the add-tracking-domain call
        # @param [String] domain an existing tracking domain name
        # @return [Hash] information about the tracking domain
        #     - [String] domain the tracking domain name
        #     - [String] created_at the date and time that the tracking domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] last_tested_at when the domain's DNS settings were last tested as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Hash] cname details about the domain's CNAME record
        #         - [Boolean] valid whether the domain's CNAME record is valid for use with Mandrill
        #         - [String] valid_after when the domain's CNAME record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
        #         - [String] error an error describing the CNAME record, or null if the record is correct
        #     - [Boolean] valid_tracking whether this domain can be used as a tracking domain for email.
        def check_tracking_domain(domain)
            _params = {:domain => domain}
            return @master.call 'urls/check-tracking-domain', _params
        end

    end
    class Webhooks
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Get the list of all webhooks defined on the account
        # @return [Array] the webhooks associated with the account
        #     - [Hash] return[] the individual webhook info
        #         - [Integer] id a unique integer indentifier for the webhook
        #         - [String] url The URL that the event data will be posted to
        #         - [String] description a description of the webhook
        #         - [String] auth_key the key used to requests for this webhook
        #         - [Array] events The message events that will be posted to the hook
        #             - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
        #         - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
        #         - [Integer] events_sent the total number of events that have ever been sent to this webhook
        #         - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
        def list()
            _params = {}
            return @master.call 'webhooks/list', _params
        end

        # Add a new webhook
        # @param [String] url the URL to POST batches of events
        # @param [String] description an optional description of the webhook
        # @param [Array] events an optional list of events that will be posted to the webhook
        #     - [String] events[] the individual event to listen for
        # @return [Hash] the information saved about the new webhook
        #     - [Integer] id a unique integer indentifier for the webhook
        #     - [String] url The URL that the event data will be posted to
        #     - [String] description a description of the webhook
        #     - [String] auth_key the key used to requests for this webhook
        #     - [Array] events The message events that will be posted to the hook
        #         - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
        #     - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
        #     - [Integer] events_sent the total number of events that have ever been sent to this webhook
        #     - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
        def add(url, description=nil, events=[])
            _params = {:url => url, :description => description, :events => events}
            return @master.call 'webhooks/add', _params
        end

        # Given the ID of an existing webhook, return the data about it
        # @param [Integer] id the unique identifier of a webhook belonging to this account
        # @return [Hash] the information about the webhook
        #     - [Integer] id a unique integer indentifier for the webhook
        #     - [String] url The URL that the event data will be posted to
        #     - [String] description a description of the webhook
        #     - [String] auth_key the key used to requests for this webhook
        #     - [Array] events The message events that will be posted to the hook
        #         - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
        #     - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
        #     - [Integer] events_sent the total number of events that have ever been sent to this webhook
        #     - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
        def info(id)
            _params = {:id => id}
            return @master.call 'webhooks/info', _params
        end

        # Update an existing webhook
        # @param [Integer] id the unique identifier of a webhook belonging to this account
        # @param [String] url the URL to POST batches of events
        # @param [String] description an optional description of the webhook
        # @param [Array] events an optional list of events that will be posted to the webhook
        #     - [String] events[] the individual event to listen for
        # @return [Hash] the information for the updated webhook
        #     - [Integer] id a unique integer indentifier for the webhook
        #     - [String] url The URL that the event data will be posted to
        #     - [String] description a description of the webhook
        #     - [String] auth_key the key used to requests for this webhook
        #     - [Array] events The message events that will be posted to the hook
        #         - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
        #     - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
        #     - [Integer] events_sent the total number of events that have ever been sent to this webhook
        #     - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
        def update(id, url, description=nil, events=[])
            _params = {:id => id, :url => url, :description => description, :events => events}
            return @master.call 'webhooks/update', _params
        end

        # Delete an existing webhook
        # @param [Integer] id the unique identifier of a webhook belonging to this account
        # @return [Hash] the information for the deleted webhook
        #     - [Integer] id a unique integer indentifier for the webhook
        #     - [String] url The URL that the event data will be posted to
        #     - [String] description a description of the webhook
        #     - [String] auth_key the key used to requests for this webhook
        #     - [Array] events The message events that will be posted to the hook
        #         - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
        #     - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
        #     - [Integer] events_sent the total number of events that have ever been sent to this webhook
        #     - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
        def delete(id)
            _params = {:id => id}
            return @master.call 'webhooks/delete', _params
        end

    end
    class Senders
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Return the senders that have tried to use this account.
        # @return [Array] an array of sender data, one for each sending addresses used by the account
        #     - [Hash] return[] the information on each sending address in the account
        #         - [String] address the sender's email address
        #         - [String] created_at the date and time that the sender was first seen by Mandrill as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the total number of messages sent by this sender
        #         - [Integer] hard_bounces the total number of hard bounces by messages by this sender
        #         - [Integer] soft_bounces the total number of soft bounces by messages by this sender
        #         - [Integer] rejects the total number of rejected messages by this sender
        #         - [Integer] complaints the total number of spam complaints received for messages by this sender
        #         - [Integer] unsubs the total number of unsubscribe requests received for messages by this sender
        #         - [Integer] opens the total number of times messages by this sender have been opened
        #         - [Integer] clicks the total number of times tracked URLs in messages by this sender have been clicked
        #         - [Integer] unique_opens the number of unique opens for emails sent for this sender
        #         - [Integer] unique_clicks the number of unique clicks for emails sent for this sender
        def list()
            _params = {}
            return @master.call 'senders/list', _params
        end

        # Returns the sender domains that have been added to this account.
        # @return [Array] an array of sender domain data, one for each sending domain used by the account
        #     - [Hash] return[] the information on each sending domain for the account
        #         - [String] domain the sender domain name
        #         - [String] created_at the date and time that the sending domain was first seen as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] last_tested_at when the domain's DNS settings were last tested as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [Hash] spf details about the domain's SPF record
        #             - [Boolean] valid whether the domain's SPF record is valid for use with Mandrill
        #             - [String] valid_after when the domain's SPF record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
        #             - [String] error an error describing the spf record, or null if the record is correct
        #         - [Hash] dkim details about the domain's DKIM record
        #             - [Boolean] valid whether the domain's DKIM record is valid for use with Mandrill
        #             - [String] valid_after when the domain's DKIM record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
        #             - [String] error an error describing the DKIM record, or null if the record is correct
        #         - [String] verified_at if the domain has been verified, this indicates when that verification occurred as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [Boolean] valid_signing whether this domain can be used to authenticate mail, either for itself or as a custom signing domain. If this is false but spf and dkim are both valid, you will need to verify the domain before using it to authenticate mail
        def domains()
            _params = {}
            return @master.call 'senders/domains', _params
        end

        # Adds a sender domain to your account. Sender domains are added automatically as you send, but you can use this call to add them ahead of time.
        # @param [String] domain a domain name
        # @return [Hash] information about the domain
        #     - [String] domain the sender domain name
        #     - [String] created_at the date and time that the sending domain was first seen as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] last_tested_at when the domain's DNS settings were last tested as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Hash] spf details about the domain's SPF record
        #         - [Boolean] valid whether the domain's SPF record is valid for use with Mandrill
        #         - [String] valid_after when the domain's SPF record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
        #         - [String] error an error describing the spf record, or null if the record is correct
        #     - [Hash] dkim details about the domain's DKIM record
        #         - [Boolean] valid whether the domain's DKIM record is valid for use with Mandrill
        #         - [String] valid_after when the domain's DKIM record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
        #         - [String] error an error describing the DKIM record, or null if the record is correct
        #     - [String] verified_at if the domain has been verified, this indicates when that verification occurred as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Boolean] valid_signing whether this domain can be used to authenticate mail, either for itself or as a custom signing domain. If this is false but spf and dkim are both valid, you will need to verify the domain before using it to authenticate mail
        def add_domain(domain)
            _params = {:domain => domain}
            return @master.call 'senders/add-domain', _params
        end

        # Checks the SPF and DKIM settings for a domain. If you haven't already added this domain to your account, it will be added automatically.
        # @param [String] domain a domain name
        # @return [Hash] information about the sender domain
        #     - [String] domain the sender domain name
        #     - [String] created_at the date and time that the sending domain was first seen as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] last_tested_at when the domain's DNS settings were last tested as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Hash] spf details about the domain's SPF record
        #         - [Boolean] valid whether the domain's SPF record is valid for use with Mandrill
        #         - [String] valid_after when the domain's SPF record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
        #         - [String] error an error describing the spf record, or null if the record is correct
        #     - [Hash] dkim details about the domain's DKIM record
        #         - [Boolean] valid whether the domain's DKIM record is valid for use with Mandrill
        #         - [String] valid_after when the domain's DKIM record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
        #         - [String] error an error describing the DKIM record, or null if the record is correct
        #     - [String] verified_at if the domain has been verified, this indicates when that verification occurred as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Boolean] valid_signing whether this domain can be used to authenticate mail, either for itself or as a custom signing domain. If this is false but spf and dkim are both valid, you will need to verify the domain before using it to authenticate mail
        def check_domain(domain)
            _params = {:domain => domain}
            return @master.call 'senders/check-domain', _params
        end

        # Sends a verification email in order to verify ownership of a domain. Domain verification is a required step to confirm ownership of a domain. Once a domain has been verified in a Mandrill account, other accounts may not have their messages signed by that domain unless they also verify the domain. This prevents other Mandrill accounts from sending mail signed by your domain.
        # @param [String] domain a domain name at which you can receive email
        # @param [String] mailbox a mailbox at the domain where the verification email should be sent
        # @return [Hash] information about the verification that was sent
        #     - [String] status "sent" indicates that the verification has been sent, "already_verified" indicates that the domain has already been verified with your account
        #     - [String] domain the domain name you provided
        #     - [String] email the email address the verification email was sent to
        def verify_domain(domain, mailbox)
            _params = {:domain => domain, :mailbox => mailbox}
            return @master.call 'senders/verify-domain', _params
        end

        # Return more detailed information about a single sender, including aggregates of recent stats
        # @param [String] address the email address of the sender
        # @return [Hash] the detailed information on the sender
        #     - [String] address the sender's email address
        #     - [String] created_at the date and time that the sender was first seen by Mandrill as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] sent the total number of messages sent by this sender
        #     - [Integer] hard_bounces the total number of hard bounces by messages by this sender
        #     - [Integer] soft_bounces the total number of soft bounces by messages by this sender
        #     - [Integer] rejects the total number of rejected messages by this sender
        #     - [Integer] complaints the total number of spam complaints received for messages by this sender
        #     - [Integer] unsubs the total number of unsubscribe requests received for messages by this sender
        #     - [Integer] opens the total number of times messages by this sender have been opened
        #     - [Integer] clicks the total number of times tracked URLs in messages by this sender have been clicked
        #     - [Hash] stats an aggregate summary of the sender's sending stats
        #         - [Hash] today stats for this sender so far today
        #             - [Integer] sent the number of emails sent for this sender so far today
        #             - [Integer] hard_bounces the number of emails hard bounced for this sender so far today
        #             - [Integer] soft_bounces the number of emails soft bounced for this sender so far today
        #             - [Integer] rejects the number of emails rejected for sending this sender so far today
        #             - [Integer] complaints the number of spam complaints for this sender so far today
        #             - [Integer] unsubs the number of unsubscribes for this sender so far today
        #             - [Integer] opens the number of times emails have been opened for this sender so far today
        #             - [Integer] unique_opens the number of unique opens for emails sent for this sender so far today
        #             - [Integer] clicks the number of URLs that have been clicked for this sender so far today
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender so far today
        #         - [Hash] last_7_days stats for this sender in the last 7 days
        #             - [Integer] sent the number of emails sent for this sender in the last 7 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this sender in the last 7 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this sender in the last 7 days
        #             - [Integer] rejects the number of emails rejected for sending this sender in the last 7 days
        #             - [Integer] complaints the number of spam complaints for this sender in the last 7 days
        #             - [Integer] unsubs the number of unsubscribes for this sender in the last 7 days
        #             - [Integer] opens the number of times emails have been opened for this sender in the last 7 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this sender in the last 7 days
        #             - [Integer] clicks the number of URLs that have been clicked for this sender in the last 7 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender in the last 7 days
        #         - [Hash] last_30_days stats for this sender in the last 30 days
        #             - [Integer] sent the number of emails sent for this sender in the last 30 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this sender in the last 30 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this sender in the last 30 days
        #             - [Integer] rejects the number of emails rejected for sending this sender in the last 30 days
        #             - [Integer] complaints the number of spam complaints for this sender in the last 30 days
        #             - [Integer] unsubs the number of unsubscribes for this sender in the last 30 days
        #             - [Integer] opens the number of times emails have been opened for this sender in the last 30 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this sender in the last 30 days
        #             - [Integer] clicks the number of URLs that have been clicked for this sender in the last 30 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender in the last 30 days
        #         - [Hash] last_60_days stats for this sender in the last 60 days
        #             - [Integer] sent the number of emails sent for this sender in the last 60 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this sender in the last 60 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this sender in the last 60 days
        #             - [Integer] rejects the number of emails rejected for sending this sender in the last 60 days
        #             - [Integer] complaints the number of spam complaints for this sender in the last 60 days
        #             - [Integer] unsubs the number of unsubscribes for this sender in the last 60 days
        #             - [Integer] opens the number of times emails have been opened for this sender in the last 60 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this sender in the last 60 days
        #             - [Integer] clicks the number of URLs that have been clicked for this sender in the last 60 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender in the last 60 days
        #         - [Hash] last_90_days stats for this sender in the last 90 days
        #             - [Integer] sent the number of emails sent for this sender in the last 90 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this sender in the last 90 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this sender in the last 90 days
        #             - [Integer] rejects the number of emails rejected for sending this sender in the last 90 days
        #             - [Integer] complaints the number of spam complaints for this sender in the last 90 days
        #             - [Integer] unsubs the number of unsubscribes for this sender in the last 90 days
        #             - [Integer] opens the number of times emails have been opened for this sender in the last 90 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this sender in the last 90 days
        #             - [Integer] clicks the number of URLs that have been clicked for this sender in the last 90 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender in the last 90 days
        def info(address)
            _params = {:address => address}
            return @master.call 'senders/info', _params
        end

        # Return the recent history (hourly stats for the last 30 days) for a sender
        # @param [String] address the email address of the sender
        # @return [Array] the array of history information
        #     - [Hash] return[] the stats for a single hour
        #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the number of emails that were sent during the hour
        #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
        #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
        #         - [Integer] rejects the number of emails that were rejected during the hour
        #         - [Integer] complaints the number of spam complaints received during the hour
        #         - [Integer] opens the number of emails opened during the hour
        #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
        #         - [Integer] clicks the number of tracked URLs clicked during the hour
        #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
        def time_series(address)
            _params = {:address => address}
            return @master.call 'senders/time-series', _params
        end

    end
    class Metadata
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Get the list of custom metadata fields indexed for the account.
        # @return [Array] the custom metadata fields for the account
        #     - [Hash] return[] the individual custom metadata field info
        #         - [String] name the unique identifier of the metadata field to update
        #         - [String] state the current state of the metadata field, one of "active", "delete", or "index"
        #         - [String] view_template Mustache template to control how the metadata is rendered in your activity log
        def list()
            _params = {}
            return @master.call 'metadata/list', _params
        end

        # Add a new custom metadata field to be indexed for the account.
        # @param [String] name a unique identifier for the metadata field
        # @param [String] view_template optional Mustache template to control how the metadata is rendered in your activity log
        # @return [Hash] the information saved about the new metadata field
        #     - [String] name the unique identifier of the metadata field to update
        #     - [String] state the current state of the metadata field, one of "active", "delete", or "index"
        #     - [String] view_template Mustache template to control how the metadata is rendered in your activity log
        def add(name, view_template=nil)
            _params = {:name => name, :view_template => view_template}
            return @master.call 'metadata/add', _params
        end

        # Update an existing custom metadata field.
        # @param [String] name the unique identifier of the metadata field to update
        # @param [String] view_template optional Mustache template to control how the metadata is rendered in your activity log
        # @return [Hash] the information for the updated metadata field
        #     - [String] name the unique identifier of the metadata field to update
        #     - [String] state the current state of the metadata field, one of "active", "delete", or "index"
        #     - [String] view_template Mustache template to control how the metadata is rendered in your activity log
        def update(name, view_template)
            _params = {:name => name, :view_template => view_template}
            return @master.call 'metadata/update', _params
        end

        # Delete an existing custom metadata field. Deletion isn't instataneous, and /metadata/list will continue to return the field until the asynchronous deletion process is complete.
        # @param [String] name the unique identifier of the metadata field to update
        # @return [Hash] the information for the deleted metadata field
        #     - [String] name the unique identifier of the metadata field to update
        #     - [String] state the current state of the metadata field, one of "active", "delete", or "index"
        #     - [String] view_template Mustache template to control how the metadata is rendered in your activity log
        def delete(name)
            _params = {:name => name}
            return @master.call 'metadata/delete', _params
        end

    end
end

