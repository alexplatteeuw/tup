import Analytics from 'analytics'
import googleAnalytics from '@analytics/google-analytics'

const initializeGoogleAnalytics = () => {
  const host = window.location.hostname;
  if (host != "localhost") {
    /* Initialize analytics */
    const analytics = Analytics({
      app: 'matup',
      plugins: [
        googleAnalytics({
          trackingId: 'UA-201241086-1',
        })
      ]
    })

    /* Track a page view */
    analytics.page()
  }
};

export { initializeGoogleAnalytics };
