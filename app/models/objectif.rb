# encoding: UTF-8
class Objectif < ActiveRecord::Base
  belongs_to :objectivable, :polymorphic => true
end
