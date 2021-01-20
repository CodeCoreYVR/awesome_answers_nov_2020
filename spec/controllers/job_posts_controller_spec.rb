require 'rails_helper'
# rails g rspec:controller job_posts --controller-specs --no-request-specs
RSpec.describe JobPostsController, type: :controller do
    describe '#new' do
        it 'render the new template' do
            # Given

            # When
            get(:new)

            # Then
            expect(response).to(render_template(:new)) #👈🏻 We wverify that the response will render out the tempalte called 'new' using the matcher 'render_template'
            # response is an object that re-presents the HTTP- Response
            # Rspec makes this opbejct available within the specs
        end
        it 'sets an instance variable with new job posts' do
            # Given
            # When
            get(:new)
            # Then
            expect(assigns(:job_post)).to(be_a_new(JobPost))
            # assign(:job_past) is available from the 'rail-controller-testing'. this allows you to grab an instance varaibale, it takes symbol(:job_post)- the name of instance varaible
            # All models are available to controllers 
        end
        
    end

end
