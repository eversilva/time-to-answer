class AdminsBackoffice::QuestionsController < AdminsBackofficeController
    before_action :set_question, only: [:update, :edit, :destroy]
    before_action :set_subjects, only: [:edit, :new]
  
    def index
      @questions = Question.all.page(params[:page]).per(5)
    end
  
    def edit
    end
  
    def new 
      @question = Question.new
    end
  
    def create
      @question = Question.create(params_question)
      if @question.save()
        redirect_to admins_backoffice_questions_path, notice: "Questão cadastrada com sucesso!"
      else
        render :edit
      end
    end
  
    def update    
      if @question.update(params_question)
        redirect_to admins_backoffice_questions_path, notice: "Questão atualizada com sucesso!"
      else
        render :edit
      end
    end
  
    def destroy
      if @question.destroy
        redirect_to admins_backoffice_questions_path, notice: "Questão deletada com sucesso!"
      else
        render :index
      end
    end
  
    private
  
    def params_question
      params.require(:question).permit(:description, :subject_id)
    end
  
  
    def set_question
      @question = Question.find(params[:id])
    end

    def set_subjects
      @subjects = Subject.all
    end
  end
  