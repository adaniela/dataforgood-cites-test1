class CreateSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :species do |t|
      t.string :taxonRank
      t.integer :idCITES
      t.string :nomSC

      t.timestamps
    end
  end
end
