class AddIndexToOrdid < ActiveRecord::Migration
  def self.up
    add_index(:bin, :uppflettiord)
    add_index(:bin, :wordid)
    add_index(:bin, :hluti)
  end

  def self.down
    remove_index(:bin, :uppflettiord)
    remove_index(:bin, :wordid)
    remove_index(:bin, :hluti)
  end
end
