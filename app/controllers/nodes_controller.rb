class NodesController < ApplicationController

  before_filter :init_params , :except => [:index, :new, :create]

  def index
    @nodes = Node.scoped.ordered #TODO: paginate
  end

  def new
    @node = Node.new
  end

  def create
    @node = Node.new(params[:node])
    if @node.save
      redirect_to nodes_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @node.update_attributes(params[:node])
      redirect_to nodes_path
    else
      render action: :edit
    end

  end

  def destroy
    @node.destroy
    redirect_to nodes_path
  end

  private

  def init_params
    @node = Node.find(params[:id].to_i)
  end

end
