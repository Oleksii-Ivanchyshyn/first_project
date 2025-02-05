class QuestionsController < ApplicationController
    before_action :set_question, only: %i[update destroy show edit]

    def create
        user = current_user
        question = Question.create(question_params(user))
        flash[:notice] = 'Створено нове питання'
        redirect_to question_path(question)
    end


    def update
        if  
            @question.update(question_params(current_user))
            flash[:notice] = 'Збережено'
            redirect_to question_path(@question)
        else
            render :edit
        end
    end

    def destroy
        @question.destroy
        flash[:notice] = 'Видалено'
        flash[:success] = 'Question deleted!'
        redirect_to root_path
    end

    def show
     
    end

    def index
        @questions = Question.all
        @questions = Question.all

        response = RestClient.get('https://678e1145a64c82aeb11ed9b2.mockapi.io/api/v1/questions')
        
        if response.code == 200
            @api_questions = JSON.parse(response.body)
        else
            @api_questions = []
            flash[:alert] = 'Не вдалось завантажити з API'
        end
    end

    def new
        @question = Question.new
    end
    
    def edit
      @question = Question.find(params[:id])  
    end
    
    def my_questions
       user = User.find(current_user)
        p user.questions
     @questions = current_user.questions
    end


        
        
    private
    
    def question_params(user)
        question_params = params.require(:question).permit(:body, user_id: user_id)
    end

    def set_question
        @question = Question.find(params[:id])
    end


end