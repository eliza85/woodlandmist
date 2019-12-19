require('rspec')
require('project')



  describe '#Stage' do

    before(:each)do
    Stage.clear()
    end

    describe("#save") do
      it('saves a stage')do
      stage = Stage.new('Blue Stage', nil) # nil added as second argument
      stage.save()
      stage2 = Stage.new('Red Stage', nil) # nil added as second argument
      stage2.save()
      expect(Stage.all).to(eq([stage, stage2]))
    end
  end

    describe ('.all') do
      it("is empty")do
        expect(Stage.all()).to(eq([]))
      end
    end

    describe('.clear') do
      it("clears all stages") do
        stage = Stage.new('Blue Stage', nil)
        stage.save()
        stage2 = Stage.new('Red Stage', nil)
        stage2.save()
        Stage.clear()
        expect(Stage.all).to(eq([]))
      end
    end

    describe('#update_name') do
      it ('updates a stage name by id') do
        stage = Stage.new('Blue Stage', nil)
        stage.save()
        stage.update_name('Bluish Stage')
        expect(stage.name).to(eq('Bluish Stage'))
      end
    end

    describe('#delete') do
      it('deletes a stage by id') do
        stage = Stage.new('Blue Stage', nil)
        stage.save()
        stage2 = Stage.new('Red Stage', nil)
        stage2.save()
        stage.delete()
        expect(Stage.all).to(eq([stage2]))
      end
    end

    describe('#==') do
      it('is the same stage if it has the same attributes') do
      stage = Stage.new("Blue Stage", nil)
      stage2 = Stage.new("Blue Stage", nil)
      expect(stage).to(eq(stage2))
    end
  end

  describe('.find') do
    it("finds an stage by id") do
      stage = Stage.new("Blue Stage", nil)
      stage.save()
      stage2 = Stage.new("Red Stage", nil)
      stage2.save()
      expect(Stage.find(stage.id)).to(eq(stage))
    end
  end

  describe('.search') do
    it("finds the stage by name") do
      stage = Stage.new("Blue Stage", nil)
      stage.save()
      expect(Stage.search(stage.name)).to(eq([stage]))
    end
  end
end
