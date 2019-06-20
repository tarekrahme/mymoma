desc "This task is called by the Heroku scheduler add-on"
task :goal_updater => :environment do
  Wallet.all.each do |wallet|
    AddMonthlySavingJob.perform_now(wallet)
  end
end
