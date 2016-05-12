class PagesController < ApplicationController
def index
    @domains = Domain.where(:role=>1)
    @domain = Domain.where(:role=>0)
end
end
