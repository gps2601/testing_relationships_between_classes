require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do
  context "when locked" do
    it "refuses to be read when initialized" do
      diary_double = double("diary object", :read => "dont go away!")
      the_secret_diary = SecretDiary.new(diary_double)
      expect(the_secret_diary.read).to eq("Go away!")
    end

    it "refuses to be written when initialized" do
      the_secret_diary = SecretDiary.new("doesn't matter")
      expect(the_secret_diary.write("also doesn't matter")).to eq("Go away!")
    end
  end

  context "when unlocked" do
    it "gets read" do
      diary_double = double("diary object", :read => "blurgh")
      the_secret_diary = SecretDiary.new(diary_double)
      the_secret_diary.unlock
      expect(the_secret_diary.read).to eq("blurgh")
    end

    it "gets written" do
      diary_double = double("diary object", :write => "not important")
      the_secret_diary = SecretDiary.new(diary_double)
      the_secret_diary.unlock
      expect(the_secret_diary.write("hmm")).to eq(nil)
    end
  end
end
