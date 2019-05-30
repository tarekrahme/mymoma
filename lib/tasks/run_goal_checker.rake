namespace :run_goal_checker do
  task run: :environment do
    Wallet.all.each do |wallet|
      AddMonthlySavingJob.perform_now(wallet)
    end
  end
end
