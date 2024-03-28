import Config

config :payment_client_rl, RateLimiter,
  rate_limiter: PaymentClientRl.RateLimiters.LeakyBucket,
  timeframe_max_requests: 60,
  timeframe_units: :seconds,
  timeframe: 60
