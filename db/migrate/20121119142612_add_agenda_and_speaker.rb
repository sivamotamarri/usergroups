class AddAgendaAndSpeaker < ActiveRecord::Migration
  def up
  	change_table :events do |t|      
      t.text  :agenda_and_speakers
    end
  end
end
