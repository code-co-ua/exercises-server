/**
 * For testing server available/not available
 * @todo in progress
 */
function access(s) {
    if(Math.random() >= 0.5) {
        s.abort();
        return;
    }
    s.allow();
}
