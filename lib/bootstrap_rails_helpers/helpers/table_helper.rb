module BootstrapRailsHelpers
  module Helpers
    module TableHelper

      def table opts = {}, &block
        opts[:class] ||= ''
        opts[:class] += ' zebra-striped' if opts[:striped]
        opts[:class] += ' bordered-table' if opts[:bordered]
        opts[:class] += ' sortabletable' if opts[:sortable]
        opts[:class] += ' ' + cycle('yellow', 'blue', 'green') if opts[:color]
        opts[:style] = opts[:style] || {} if opts[:style].present?
        content_tag( :table, :id => opts[:id], :class => opts[:class], :style => opts[:style] ){ yield }
      end

      def table_head opts = {}, &block
        content_tag( :thead, opts ){ yield }
      end

      def table_body opts = {}, &block
        content_tag( :tbody, opts ){ yield }
      end

      def table_row opts = {}, &block
        opts[:class] ||= ''
        opts[:class] += ' filteringbar' if opts[:filter]
        opts[:style] = opts[:style] || {} if opts[:style].present?
        content_tag( :tr, :class => opts[:class], :id => opts[:id], :style => opts[:style] ){ yield }
      end

      def table_col opts = {}, &block
        opts[:class] ||= ''
        opts[:class] += ' header' if opts[:header]
        opts[:class] += ' headerSort' + opts[:sort].titleize if opts[:sort]
        opts[:style] = opts[:style] || {} if opts[:style].present?
        if opts.has_key?(:loading)
          opts[:class] += ' loading'
          opts[:value] = image_tag( asset_path('loading_small.gif'), :style => "display:#{(opts[:value].blank? and opts[:loading]) ? 'inline' : 'none'}")
        end
        content_tag( (opts[:header] ? :th : :td), :class => opts[:class], :style => opts[:style]) do
          opts[:value] || yield
        end
      end

      def init_list opts = {}
        render 'bootstrap_common/init_list', opts
      end

    end
  end
end