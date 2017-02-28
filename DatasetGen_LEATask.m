
Qid = unique(TREC(:,3));
Wid = unique(TREC(:,2));

qids = unique(x(:,1));
MTRX(1:length(Wid), qids) = -1;

for q = 1:length(Qid)
    
    Qidx = Qid(q);
    idx = find(x(:,1) == Qidx);
    workers = x(idx,2);
    answers = x(idx,3);
    
    for w = 1:length(workers)
        widx = find(Wid == workers(w));
        MTRX(widx, Qidx) = answers(w);
    end
end

difs = setdiff(qids, Qid);
MTRX(:, difs) = [];


