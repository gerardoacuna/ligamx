require 'spec_helper'

describe Matchup do
  subject { Matchup.new(team1_id: 1, team2_id: 2, week_id: 3) }

  describe 'Validation' do
    context 'it is valid' do
      it 'with all the attributes' do
        subject.should be_valid
      end

    end
    context 'it is invalid' do
      it 'without a team 1' do
        subject.team1_id = nil
        subject.should_not be_valid
      end
      it 'without a team 2' do
        subject.team1_id = nil
        subject.should_not be_valid
      end
      it 'without a week' do
        subject.week_id = nil
        subject.should_not be_valid
      end
    end
  end

  describe '#all_team_matchups' do
    let(:other) { Matchup.create(team1_id: 3, team2_id: 2, week_id: 3) }
    let(:matches) do
      [ Matchup.create(team1_id: 1, team2_id: 2, week_id: 3),
        Matchup.create(team1_id: 2, team2_id: 1, week_id: 3) ]
    end

    it 'returns the matchups where the team participates' do
      Matchup.all_team_matchups(1).should == matches
    end
    it 'does not returns matchups of not participating teams' do
      Matchup.all_team_matchups(1).should_not include other
    end

  end

end

